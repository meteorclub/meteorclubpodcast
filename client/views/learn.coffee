Template.learn.rendered = () ->
  $('input#referrer').val(decodeURI(document.referrer))

Template.learn.events
  'submit form': (e, t) ->
    e.preventDefault()
    signupInfo = SimpleForm.processForm(e.target)
    Meteor.call 'apply', signupInfo, () ->
      SimpleForm.resetForm(e.target)
      Router.go('/apply/thanks')
