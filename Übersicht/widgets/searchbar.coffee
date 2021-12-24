refreshFrequency: false

render: () -> """
  <form method="get" action="#" class="search_container">
  <input type="text" size="25" id="keyword" placeholder="Search">
  <input type="submit" id="enter" value="→">
</form>
"""
afterRender: (enter) ->
  $(enter).on 'click', '#enter', =>
    str = document.getElementById('keyword').value
    result1 = str.indexOf("http")
    result2 = str.indexOf('.')
    if result1 != -1 && result2 = -1
        marker = str.indexOf(':')
        url = str.substr(marker + 3)
        @run "open 'https://'" + url
    else if result1 = -1 && result2 != -1
        @run "open 'https://'" + str
    else if result1 = -1 && result2 = -1
        targetStr = ' '
        regExp = new RegExp(targetStr, 'g')
        search = str.replace(regExp, '+')
        @run "open 'https:google.com/search'" + "?q=" + search
    return

style: """
.search_container{
  position: relative;
  top: 816px;
  left: 500px;
  box-sizing: border-box;
  display: block;
  padding: 3px 10px;
  border-radius: 10px;
  height: 2.2em;
  width: 450px;
  overflow: hidden;
  background: #D8DEE9;
  opacity: 50%;
  box-shadow: 0px 0px 0px rgba(0,0,0,0.9) inset;
  font-family: JetBrains Mono
}
.search_container input[type="text"]{
  border: none;
  height: 2.3em;
  background: none;
  width: 400px;
  padding-left: 1em;
  color: #2E3440;
  font-family: Jetbrains Mono Regular
}
.search_container input[type="text"]:focus {
  outline: 0;
}
.search_container input[type="submit"]{
  cursor: pointer;
  font-size: 1.3em;
  border: none;
  background: none;
  color: #2E3440;
  position: absolute;
  height: 2.5em;
  right: 8px;
  top: -10px;
  outline : none;
}
.search_container ::-webkit-input-placeholder {
  color: #2E3440;
  font-family: JetBrains Mono SemiBold;
}

"""