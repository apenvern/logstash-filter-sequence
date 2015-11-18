# encoding: utf-8
require 'spec_helper'
require "logstash/filters/example"

describe LogStash::Filters::Sequence do
  describe "Add a sequence number to a log entry do"
    let(:config) do <<-CONFIG
      filter {
        sequence {
          field => "sequence"
        }
      }
    CONFIG
    end

    sample("field" => "seq_field") do
      expect(subject).to include("seq_field")
    end
  end
end

