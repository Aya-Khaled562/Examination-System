let userValue = document.getElementById("user");
let smallUser = document.getElementById("smalluser");
let password = document.getElementById("password");
let smallPassword = document.getElementById("smallpassword"),
logout = document.querySelector(".logout a");

let login = document.getElementById("loginbutton");
let form = document.querySelector(".form");
// removing the style of the small after typing
userValue.addEventListener('keydown',()=>{smallUser.style.display = "none";});
password.addEventListener('keydown',()=>{smallPassword.style.display = "none";});

form.addEventListener("submit", (e) => {
  e.preventDefault();
});
login.addEventListener("click", async(e)=>{

    e.preventDefault();
    
    let user = await LoadName(userValue.value);
    console.log(user);
    if(user.length!=0){
      if(user[0].password===password.value){
        localStorage.setItem("id",user[0].id);
        localStorage.setItem("userName",user[0].userName);
        localStorage.setItem("email",user[0].email);
        localStorage.setItem("role",user[0].role);
        localStorage.setItem("firstName",user[0].firstName);
        localStorage.setItem("lastName",user[0].lastName);
        if(user[0].role==="employee"){
          window.location.href="employeesProfile.html";
        }else if(user[0].role==="admin"){  
          window.location.href="admin.html";
        }else if(user[0].role==="secuirty"){
          window.location.href="attendance.html";
        }
      }
      else{
        smallPassword.style.display="inline";
        e.preventDefault();
      }
    }else{
      smallUser.style.display="inline";
      e.preventDefault();
    }


});
function reset(){
  user.value = "";
  password.value = "";
  smallUser.style.display="none";
  smallPassword.style.display="none";
}

async function LoadName(employee){
  let response = await fetch(`http://localhost:3000/employees?userName=${employee}`);

  let user = await response.json();
  console.log(user);
  return user;
}

// logout 
logout.addEventListener('click', ()=>{
  console.log("done ")
})

window.history.forward();
function noBack() {
  window.history.forward();
}
