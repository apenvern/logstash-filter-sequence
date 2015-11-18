# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "date"

# This filter will adds a sequence number to a log entry. 
# A the start of logstash the id start with a timestamp 
# and increment by 1 for each log event.
#
class LogStash::Filters::Sequence < LogStash::Filters::Base

  # The config looks like this:
  #
  #     filter {
  #       sequence {
  #         field => "sequence"
  #       }
  #     }
  #
  # The `field` is the field you want added to the event.
  config_name "sequence"
  
  config :field, :validate => :string, :required => false, :default => "sequence"

  public
  def register
    # Nothing
  end # def register

  public
  def initialize(config = {})
    super

    @threadsafe = false

    # This filter needs to keep state.
    @sequence=DateTime.now.strftime('%Q').to_i
  end # def initialize

  public
  def filter(event)
    return unless filter?(event)
    event[@field] = @sequence
    @sequence = @sequence + 1
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Sequence
