// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  $('#button').on('click', function () {
    App.chat.send({sent_by: 'Tester', body: 'Hello!'})
    console.log('button clicked.')
  })
})