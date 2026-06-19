$(function(){
  let d = JSON.parse(localStorage.getItem("tasks")) || [];
  function save(){
    localStorage.setItem("tasks", JSON.stringify(d));
  }
  function show(){
    $("#ul1").html("");
    for(let i = 0; i < d.length; i++){
      $("#ul1").append(
        "<li data-i='" + i + "' class='" + (d[i].done ? "done" : "") + "'>" +
          "<span>" + d[i].text + "</span>" +
          "<div class='btns'>" +
            "<button class='ok'>ok</button>" +
            "<button class='del'>x</button>" +
          "</div>" +
        "</li>"
      );
    }
  }
  $("#btn1").click(function(){
    let a = $("#in1").val();
    if(a.trim() === "") return;
    d.push({
      text: a,
      done: false
    });
    $("#in1").val("");
    save();
    show();
  });
  $(document).on("click", ".ok", function(){
    let i = $(this).closest("li").data("i");
    d[i].done = !d[i].done;
    save();
    show();
  });
  $(document).on("click", ".del", function(){
    let i = $(this).closest("li").data("i");
    d.splice(i, 1);
    save();
    show();
  });
  show();
});
