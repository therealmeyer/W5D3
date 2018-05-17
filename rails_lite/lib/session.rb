require 'json'

class Session
  # find the cookie for this app
  # deserialize the cookie into a hash
  def initialize(req)
    session_cookie = req.cookies['_rails_lite_app']
    if session_cookie
      @content = JSON.parse(session_cookie)
    else
      @content = {}
    end
  end

  def [](key)
    @content[key]
  end

  def []=(key, val)
    @content[key] = val
  end

  # serialize the hash into json and save in a cookie
  # add to the responses cookies
  def store_session(res)
    res_content = @content.to_json
    res.set_cookie("_rails_lite_app",res_content)
  end
end
