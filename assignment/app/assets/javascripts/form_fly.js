function addAddressField() {
 
    var date = new Date();
 
    var mSec = date.getTime(); 

    idAttributName = "company_employees_attributes_0_kind".replace("0", mSec);
    nameAttributName = "company[employees][0][name]".replace("0", mSec);
 
    idAttributEmail =  "company_employees_attributes_0_email".replace("0", mSec);
    nameAttributEmail =  "company[employees][0][email]".replace("0", mSec);

    idAttributPhone =   "company_employees_attributes_0_phone".replace("0", mSec);
    nameAttributPhone = "company[employees][0][phone]".replace("0", mSec);      
        

    var li = document.createElement("li");

    var labelName = document.createElement("label");
    labelName.setAttribute("for", idAttributName);
    var NameLabelText = document.createTextNode("Name");
    labelName.appendChild(NameLabelText);
    li.appendChild(labelName);

    var inputname = document.createElement("INPUT");
    inputname.setAttribute("type", "text");
    inputname.setAttribute("id", idAttributName);
    inputname.setAttribute("name", nameAttributName);
    li.appendChild(inputname);

 	labelemail = document.createElement("label");
    labelemail.setAttribute("for", idAttributEmail);
    labelemailtext = document.createTextNode("Email");
    labelemail.appendChild(labelemailtext);
    li.appendChild(labelemail);

    inputemail = document.createElement("INPUT");
    inputemail.setAttribute("type", "email");
    inputemail.setAttribute("id", idAttributEmail);
    inputemail.setAttribute("name", nameAttributEmail);
    li.appendChild(inputemail);


    labelphone = document.createElement("label");
    labelphone.setAttribute("for", idAttributPhone);
    labelphonetext = document.createTextNode("Phone");
    labelphone.appendChild(labelphonetext);
    li.appendChild(labelphone);
    
   	inputphone = document.createElement("INPUT");
    inputphone.setAttribute("type", "text");
    inputphone.setAttribute("id", idAttributPhone);
    inputphone.setAttribute("name", nameAttributPhone);
    li.appendChild(inputphone);
 

    document.getElementById("myList").appendChild(li);

    $("#addressHeader").show(); 


}