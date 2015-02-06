$(document).ready(function() 
{
  $('#show_answer').click( function() 
  {
    $(this).hide();

    console.log('in the house');
    if($('#next_btn').is(':visible'))
    {
      return;
    }

    $('.answer').show();
    $('.response_text').prop('disabled', true);
    var response = $('.response_text').val();
    var ans = $('.answer').data('ans').toString();
    if(response == ans)
    {
      $('#next_btn').show();
      $('#next_btn').focus();
    }
    else
    {
      $('.response_text').prop('disable', true);
      $('#try_again_btn').show();
    }
  });

  $('#try_again_btn').click( 
    function() 
    {
      $(this).hide();
      $('.answer').hide();
      $('#show_answer').show();
      $('.response_text').prop('value', '');
      $('.response_text').prop('disabled', false);
      $('.response_text').focus();
    }
  );
});
