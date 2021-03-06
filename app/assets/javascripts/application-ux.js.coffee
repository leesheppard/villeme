@Villeme = @Villeme or {}

Villeme.Ux = ( ->


  initialize = ( ->
    $(document).ready ->
      destroyAnimation()
      alerts()
      sidebarLeft()
      categoriesAnimateOnSidebar()
      return
    return
  )()

  ajaxTransition = ( ->
    $(document).ready ->
      window.wiselinks = new Wiselinks($('#main'), html4: false)
      return

    $(document).on 'page:loading', ->
      $("#main").hide()
      NProgress.start()
      return

    $(document).on 'ready page:done', ->
      setTimeout(->
        $("#main").show()
        NProgress.done()
      , 350)
      return
  )()


#  lazyLoad = ->
#    $("img").lazyload effect: "fadeIn"
#    return


  # elementos com class 'excluir' em methods remotos com animação fadeOut
  destroyAnimation = ->
    $(".excluir").click ->
      anchor = $(this).attr("data-anchor")
      $(this).parents(anchor).fadeOut("slow")
      return
    return


  # animações e ações da caixa de alerta do backend do rails
  alerts = ->
    $(".alert").animate(
      "top": 0
    , 900
    )

    # esconde o alerta depois de alguns segundos
    if $(".alert")
      setTimeout(->
        $(".alert").animate(
          "top": "-100px"
        , 900
        )
        return
      , 7000)

    # esconde o alert ao clicar no botao fechar
    $(".alert .close").click ->
      $(".alert").animate(
        "top": "-100px"
      , 900
      )
      return
    return


  sidebarLeft = ->
    $(".sub-nav-anchor").click ->
      $(this).next(".sub-nav").toggleClass("hide")
      return
    return


  modalFeedback = ( ->
    $('#modal-feedback').on 'ajax:success', (event, data, status, xhr) ->
      $(this).modal("hide")
      $("body").prepend '<div class="alert fade in alert-success alert-dismissable" style="top: 0;"> <button class="close" type="button" data-dismiss="alert" aria-hidden="true">×</button> Enviado com sucesso. Obrigado! </div>'
      setTimeout(->
        $(".alert").animate(
          "top": "-100px"
        , 500
        )
        return
      , 6000)
      return
  )()


  hoverActions = ( ->
    $(document).on 'mouseenter', '.has-hover-action', ->
      data_hover = $(this).attr("data-text-hover")
      class_toggle = $(this).attr("data-class-hover")
      $(this).text(data_hover)
      $(this).toggleClass(class_toggle)
      return

    $(document).on 'mouseleave', '.has-hover-action', ->
      data_default = $(this).attr("data-text-default")
      class_toggle = $(this).attr("data-class-hover")
      $(this).text(data_default)
      $(this).toggleClass(class_toggle)
      return
  )()


  categoriesAnimateOnSidebar = ->
    if (matchMedia('only screen and (min-width : 992px)').matches)
      $("#sidebar-left-md").mouseover ->
        $(".content").addClass "active"
        return

      $("#sidebar-left-md").mouseleave ->
        $(".content").removeClass "active"
        return

    return




  return {

    loginModal: (text) ->
      $(".js-ModalLogin").modal "toggle"
      if text isnt undefined
        $(".js-ModalLogin-alert").html(text)
      else
        $(".js-Modal-alert").html("")

      return

  }


)()