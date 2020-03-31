document.addEventListener('turbolinks:load', function(event) {
  if (typeof gtag === 'function') {
    gtag('config', 'UA-96964221-3', {
      'page_location': event.data.url
    })
  }
})
