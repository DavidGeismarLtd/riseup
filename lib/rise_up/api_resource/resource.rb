# frozen_string_literal: true

require "logger"

module RiseUp
  module ApiResource
    class Resource
      def initialize(attrs = {})
        @logger     = Logger.new($stdout)
        @__aliases  = {} # "original key" => normalized symbol
        @__raw      = {} # optional: keep original payload

        (attrs || {}).each do |key, value|
          @__raw[key.to_s] = value

          normalized = normalize_key(key)
          normalized = dedupe_key(normalized)

          @__aliases[key.to_s] = normalized
          define_singleton_reader(normalized)
          instance_variable_set("@#{normalized}", value)
        end
      end

      # Access a value using the original API label, e.g. user["Club d'affiliation"]
      def [](label)
        sym = @__aliases[label.to_s]
        sym ? instance_variable_get("@#{sym}") : nil
      end

      # Optional: map of original labels -> normalized names (strings)
      def fields
        @__aliases.transform_values!(&:to_s)
      end

      private

      def define_singleton_reader(name)
        return if respond_to?(name)

        singleton_class.class_eval { attr_reader name }
      end

      # "Club d'affiliation" => :club_d_affiliation
      # "Niveau juge"        => :niveau_juge
      # Leaves safe keys like "activateddate" unchanged
      def normalize_key(key)
        s = key.to_s

        # Prefer ActiveSupport transliteration if present
        if defined?(ActiveSupport::Inflector)
          s = ActiveSupport::Inflector.transliterate(s)
        else
          # Unicode fallback: strip diacritics
          s = s.unicode_normalize(:nfkd)
          s = s.encode("ASCII", replace: "", undef: :replace, invalid: :replace)
        end

        s = s.downcase
             .gsub(/[^\w]/, "_")   # spaces, quotes, punctuation -> _
             .gsub(/_{2,}/, "_")   # collapse multiple _
             .gsub(/^_+|_+$/, "")  # trim leading/trailing _
        s = "_#{s}" unless s.match?(/\A[a-z_]/) # must start with letter or _
        s = "field" if s.empty?
        s.to_sym
      end

      # Only dedupe against existing *instance variables* on this object
      def dedupe_key(sym)
        return sym unless instance_variable_defined?("@#{sym}")

        i = 2
        loop do
          cand = :"#{sym}_#{i}"
          return cand unless instance_variable_defined?("@#{cand}")

          i += 1
        end
      end
    end
  end
end
