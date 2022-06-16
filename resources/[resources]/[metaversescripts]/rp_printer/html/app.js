Printer = {};

let printer = false;
let doc = false;

$(document).ready(function () {
  window.addEventListener("message", function (event) {
    var action = event.data.action;
    switch (action) {
      case "open":
        doc = true;
        Printer.Open(event.data);
        break;
      case "close":
        doc = false;
        Printer.Close(event.data);
        break;
      case "start":
        printer = true;
        Printer.Start(event.data);
        break;
      case "stop":
        printer = false;
        Printer.Stop(event.data);
        break;
    }
  });
});

$(document).on("keydown", function () {
  switch (event.keyCode) {
    case 27: // ESC
      if (doc === true) {
        Printer.Close();
        doc = false;
      } else if (printer === true) {
        Printer.Stop();
        printer = false;
      }
      break;
    case 9: // ESC
      if (doc === true) {
        Printer.Close();
        doc = false;
      } else if (printer === true) {
        Printer.Stop();
        printer = false;
      }
      break;
  }
});

Printer.Open = function (data) {
  if (data.url) {
    $(".document-container").fadeIn(150);
    $(".document-image").attr("src", data.url);
  } else {
    console.log("Er is geen document aan gekoppeld!!!!!");
  }
};

Printer.Close = function (data) {
  $(".document-container").fadeOut(150);
  $.post("https://rp_printer/CloseDocument");
};

Printer.Start = function (data) {
  $(".printer-container").fadeIn(150);
};

Printer.Stop = function (data) {
  $(".printer-container").fadeOut(150);
  $.post("https://rp_printer/CloseDocument");
};

function submit() {
  $(".printer-error").html("");
  $(".printer-error").fadeOut(150);
  var url = $(".printer-input").val().toString();
  var finalUrl = processUrl(url);
  $.post("https://rp_printer/CreateDocument", JSON.stringify({ url: finalUrl }));
}

function processUrl(url) {
  var url = encodeURIComponent(url);
  console.log(url);
  var n = url.search("https%3A%2F%2Fi.imgur.com");
  var m = url.search("https%3A%2F%2Fi.pepega.xyz");
  console.log(n,m);
  if (n >= 0 || m >= 0) {
    return decodeURIComponent(url);
  } else {
    $(".printer-error").html("Link provided must be a valid imgur link");
    $(".printer-error").fadeIn(150);
  }
}

/* https://i.imgur.com/DEH2R5M.jpg */
