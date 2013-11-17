defmodule Weather.NoaaWeather do
  alias HTTPotion.Response

  @user_agent ["User-agent": "Elixir"]

  def fetch(station) do
    case HTTPotion.get(station_url(station), @user_agent) do
      Response[body: body, status_code: status, headers: _headers ]
      when status in 200..299 ->
        {:ok, body}
      Response[body: body, status_code: _status, headers: _headers ] ->
        {:error, body}
    end
  end

  def station_url(station) do
    "http://w1.weather.gov/xml/current_obs/#{station}.xml"
  end
  
end
