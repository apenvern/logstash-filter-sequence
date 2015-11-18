# Logstash Filter Sequence

This filter will adds a sequence number to a log entry. A the start of logstash the id start with a timestamp and increment by 1 for each log event.

## Installation
```sh
bin/plugin install logstash-filter-sequence
```

## Usage

```javascript
     filter {
       sequence {
         field => "sequence"
       }
     }
```

This will add a new field name sequence with for value a sequence number

## Example

```sh
bin/logstash -e 'input { stdin {} } filter { sequence { field => "sequence" } } output {stdout { codec => rubydebug }}' -w 1
Default settings used: Filter workers: 1
Logstash startup completed

test
{
       "message" => "test",
      "sequence" => 1447887439205
}
test1
{
       "message" => "test1",
      "sequence" => 1447887439206
}
```
