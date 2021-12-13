//Scripts for Signup/Signin tabs in modal
function openTab(evt, tabName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("tab");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].className = tablinks[i].className.replace("active-tab", "");
  }
  document.getElementById(tabName).style.display = "flex";
  evt.currentTarget.className += "active-tab";
}

//Scripts for fetching Signup/Signin apis in modal
async function login() {
  const form = event.target.form;
  console.log(form);
  let conn = await fetch("apis/api-login", {
    method: "POST",
    body: new FormData(form),
  });
  let response = await conn.json();
  console.log(response);
  if (conn.ok) {
    location.href = "welcome";
  } else {
    _one("#feedback_login").innerHTML = " ";
    _one("#feedback_login").classList.add("badge", "bg-danger");
    _one("#feedback_login").innerHTML = JSON.stringify(response);
  }
}

async function signup() {
  const form = event.target.form;
  console.log(form);
  let conn = await fetch("apis/api-signup", {
    method: "POST",
    body: new FormData(form),
  });
  let response = await conn.json();
  if (conn.ok) {
    location.href = "index";
  } else {
    _one("#feedback_signup").innerHTML = " ";
    _one("#feedback_signup").classList.add("badge", "bg-danger");
    _one("#feedback_signup").innerHTML = JSON.stringify(response);
  }
}
