$(function() {
   $(".jsc-all").on("click",  event => {
    let prefix = ''
    event.target.classList.forEach(element => {
      if(element.indexOf('jsc-val') > -1) {
        prefix = element.replaceAll('jsc-val', '');  
      }
    });

    if (event.target.checked) {
      $('.jscTimeChk' + prefix).prop('checked', true);
    } else {
      $('.jscTimeChk' + prefix).prop('checked', false);  
    }
   });
});