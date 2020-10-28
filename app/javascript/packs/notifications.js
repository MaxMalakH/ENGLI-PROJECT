// (function() {
  $(document).on('ready turbolinks:change turbolinks:load', function() {
    if (window.location.pathname === '/notifications/index') {
      return $.ajax('/notifications/read_all', {
        type: 'PUT',
        dataType: 'json',
        error: function(jqXHR, textStatus, errorThrown) {
          return console.log('err', textStatus)
        },
        success: function(data, textStatus, jqXHR) {
          return console.log('data', data)
        }
      });
    }
  });

// }).call(this);
