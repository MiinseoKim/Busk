var locationData,
    selectCount = 0,
    findCount = 0;

$(document).ready(function() {
  getLocationJson()
});

$("#location").keyup(function(e) {

  switch (e.keyCode) {
    case 8:
      selectCount = 0
      inputKeyEvent()
    break;

    case 32:
      if($("#location").val() == " ") emptySpaceKeyEvent()
    return

    case 13:
      if($("div").hasClass("autoCompleteBox") == true) enterKeyEvent()
    return

    case 38:
      if($("div").hasClass("autoCompleteBox") == false) return
      upKeyEvent()
    return

    case 40:
      if($("div").hasClass("autoCompleteBox") == false) return
      downKeyEvent()
    return

    default:
      inputKeyEvent()
  }

});

$(document).on("mousedown", ".autoCompleteBox",function(e) {
  e.stopImmediatePropagation();
  $("#location").val($(this).children()[2].innerHTML)
  $(".autoCompleteBox").remove()
  $(".autoCompleteContainer").remove()
})

$(document).on("blur", "#location",function() {
  selectCount = 0
  $(".autoCompleteBox").remove()
  $(".autoCompleteContainer").remove()
})

$(document).on("mousedown", "#location",function() {
  inputKeyEvent()
})

function getLocationJson() {
  $.getJSON( "https://raw.githubusercontent.com/k0102575/k0102575.github.io/master/portfolio/autocomplete/data.json", function(data) {
    locationData = data
  });
}

function upKeyEvent() {
  if($(".autoCompleteBox").hasClass("selected") == false) return
  if(selectCount == 0) return
  $("#autoCompleteBox-"+selectCount+"").removeClass('selected')
  --selectCount
  $("#autoCompleteBox-"+selectCount+"").addClass('selected')
}

function downKeyEvent() {
  if($(".autoCompleteBox").hasClass("selected") == false) {
      $("#autoCompleteBox-"+selectCount+"").addClass('selected')
      return
  }
  if(selectCount == findCount) return

  $("#autoCompleteBox-"+selectCount+"").removeClass('selected')
  ++selectCount
  $("#autoCompleteBox-"+selectCount+"").addClass('selected')
}

function enterKeyEvent() {
    $("#location").val($("#autoCompleteBox-"+selectCount+"").children()[2].innerHTML)
    $(".autoCompleteBox").remove()
    $(".autoCompleteContainer").remove()
}

function emptySpaceKeyEvent() {
  $("#location").val("")
}

function inputKeyEvent() {
  $(".autoCompleteBox").remove()
  $(".autoCompleteContainer").remove()

  var inputValue = $("#location").val()

  if(inputValue == "") return

  var searchLocation = locationData.filter(function (location) {
    return location.FULL_ADDR.match(inputValue)
  });

  if(searchLocation.length == 0) return

  $(".locapi").append("<div class='autoCompleteContainer'></div>")
  for (var i = 0; i <= 2; i++) {
    if(searchLocation[i] == undefined) return
    findCount = i
    $(".autoCompleteContainer").append(generate(searchLocation[i], i))
    if(searchLocation[i].SUB_NAME == "") return
  }
}

function generate(searchLocation, i) {
  return `
  <div class="autoCompleteBox" id="autoCompleteBox-${i}">
    <i class="fas fa-map-marker-alt"></i>
    <span class="mainName">${searchLocation.MAIN_NAME}</span>
    <span class="fullAddr">${searchLocation.FULL_ADDR}</span>
  </div>
  `;
}