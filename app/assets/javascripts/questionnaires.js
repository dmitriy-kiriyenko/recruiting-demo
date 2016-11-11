document.addEventListener("turbolinks:load", function() {

  $(".q_correct").on('click', function(){
    var checked_cnt = $(".q_correct:checked").length
    if(checked_cnt > 1 || checked_cnt == 0){
      $(".q_correct").prop('checked', false)
      $(this).prop('checked', true)
    }
  })

})

