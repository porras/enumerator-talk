#!/usr/bin/env ruby

require 'uri'
require 'net/http'
require 'json'

class Api
  def initialize(url)
    @url = url
  end

  def tracks
    Tracks.new("#{@url}/tracks").lazy
  end

  class Tracks
    include Enumerable

    def initialize(url)
      @url = url
    end

    def each
      url = @url
      loop do
        data = get(url)
        data['tracks'].each do |track|
          yield track
        end
        url = data['meta']['next']
      end
    end

    def get(url)
      JSON.parse(Net::HTTP.get(URI(url)))
    end
  end
end

class Mixtape
  def initialize(tracks_source, options = {})
    @tracks_source = tracks_source
    @duration_goal = options[:minutes] * 60
  end

  def tracks
    @track ||= begin
      total_duration = 0
      @tracks_source.tracks
        .select { |track| track['duration'] > 120 }
        .take_while { |track| (total_duration += track['duration']) < @duration_goal }
        .to_a
    end
  end

  def duration
    tracks.reduce(0) { |total, track| total + track['duration'] }
  end
end

minutes = ARGV.first || 45
api = Api.new('http://localhost:4567')
mixtape = Mixtape.new(api, minutes: minutes.to_i)

def format_duration(duration)
  sprintf("%i:%02i", *duration.divmod(60))
end

puts "#{mixtape.tracks.size} tracks (#{format_duration(mixtape.duration)})"
mixtape.tracks.each do |track|
  puts "#{track['artist']} - #{track['title']} (#{format_duration(track['duration'])})"
end
