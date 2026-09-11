/* The Bronx Cannabis Free Press — site scripts */
(function(){
  var tz = 'America/New_York';
  // Date
  document.querySelectorAll('[data-today]').forEach(function(el){
    try{ el.textContent = new Date().toLocaleDateString('en-US',{weekday:'long',year:'numeric',month:'long',day:'numeric',timeZone:tz}); }catch(e){}
  });
  // Weather (Open-Meteo, no key) — Bronx
  var wx = document.querySelectorAll('[data-weather]');
  if(wx.length && window.fetch){
    var codes={0:'Clear',1:'Mostly clear',2:'Partly cloudy',3:'Cloudy',45:'Fog',48:'Fog',51:'Drizzle',53:'Drizzle',55:'Drizzle',61:'Rain',63:'Rain',65:'Heavy rain',71:'Snow',73:'Snow',75:'Heavy snow',80:'Showers',81:'Showers',82:'Storms',95:'Thunderstorms',96:'Thunderstorms',99:'Thunderstorms'};
    fetch('https://api.open-meteo.com/v1/forecast?latitude=40.8448&longitude=-73.8648&current=temperature_2m,weather_code&temperature_unit=fahrenheit&timezone=America%2FNew_York')
      .then(function(r){return r.json()}).then(function(d){
        var t=Math.round(d.current.temperature_2m), c=codes[d.current.weather_code]||'';
        wx.forEach(function(el){ el.textContent = 'Bronx ' + t + '°F' + (c?' · '+c:''); });
      }).catch(function(){ wx.forEach(function(el){ el.textContent='Bronx, NY'; }); });
  }
  // Sponsor open-now status (Mon–Sat 9–8, Sun 10–7, ET)
  document.querySelectorAll('[data-open-status]').forEach(function(el){
    try{
      var now=new Date(new Date().toLocaleString('en-US',{timeZone:tz}));
      var d=now.getDay(), h=now.getHours()+now.getMinutes()/60;
      var open = d===0 ? (h>=10&&h<19) : (h>=9&&h<20);
      el.textContent = open ? 'Open now' : 'Closed now';
      el.className += open ? ' open' : ' closed';
    }catch(e){}
  });
  // Filters (Friendliness Index / directory)
  document.querySelectorAll('[data-filter-group]').forEach(function(group){
    var target=document.querySelector(group.getAttribute('data-filter-group'));
    group.addEventListener('click',function(e){
      var b=e.target.closest('button'); if(!b) return;
      group.querySelectorAll('button').forEach(function(x){x.classList.remove('on')}); b.classList.add('on');
      var f=b.getAttribute('data-f');
      target.querySelectorAll('[data-cat]').forEach(function(it){ it.hidden = !(f==='all' || it.getAttribute('data-cat')===f); });
    });
  });
  // Copy link
  document.querySelectorAll('[data-copy]').forEach(function(b){
    b.addEventListener('click',function(){ if(navigator.clipboard){ navigator.clipboard.writeText(location.href); b.textContent='Copied'; } });
  });
  // Newsletter (no backend yet)
  document.querySelectorAll('form[data-newsletter]').forEach(function(f){
    f.addEventListener('submit',function(e){ e.preventDefault(); var m=f.querySelector('.msg'); if(m) m.textContent='Thanks — you’re on the list. (Connect your email provider in form action to go live.)'; });
  });
})();
(function(){
  // Newsroom email built from whatever domain the site is hosted on (no hard-coded address)
  var host = (location.hostname || '').replace(/^www\./,'');
  document.querySelectorAll('[data-email]').forEach(function(a){
    var user = a.getAttribute('data-email');
    if(host && host.indexOf('.')>0){
      var addr = user + '@' + host; a.href = 'mailto:' + addr + (a.getAttribute('data-subject') ? '?subject=' + encodeURIComponent(a.getAttribute('data-subject')) : '');
      if(!a.hasAttribute('data-keep-text')) a.textContent = addr;
    } else { a.href = 'contact.html'.replace(/^/, a.getAttribute('data-rel')||''); }
  });
  // Menu panel
  var btn = document.querySelector('.menu-btn'), panel = document.getElementById('menu-panel');
  if(btn && panel){ btn.addEventListener('click', function(){ panel.hidden = !panel.hidden; btn.setAttribute('aria-expanded', String(!panel.hidden)); }); }
  // Highlights carousel arrow
  var hl = document.querySelector('.hl'), nx = document.querySelector('.hl-next');
  if(hl && nx){ nx.addEventListener('click', function(){ var end = hl.scrollLeft + hl.clientWidth >= hl.scrollWidth - 5; hl.scrollBy({left: end ? -hl.scrollWidth : 400, behavior:'smooth'}); }); }
})();
(function(){
  var u = encodeURIComponent(location.href), t = encodeURIComponent(document.title);
  var map = {x:'https://twitter.com/intent/tweet?url='+u+'&text='+t, fb:'https://www.facebook.com/sharer/sharer.php?u='+u, mail:'mailto:?subject='+t+'&body='+u};
  document.querySelectorAll('[data-share]').forEach(function(a){ a.href = map[a.getAttribute('data-share')]; });
})();
