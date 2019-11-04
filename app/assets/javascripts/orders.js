function serviceMaterials(){
    document.location.href='/service_materials';
}
$(document).ready(function() {
    $( "#service_materials" ).click(function() {
        serviceMaterials();
    });
});


function newPatient(){
    document.location.href='/patients/new';
}
$(document).ready(function() {
    $( "#new_patient" ).click(function() {
        newPatient();
    });
});

function allPatient(){
    document.location.href='/patients';
}
$(document).ready(function() {
    $( "#all_patient" ).click(function() {
        allPatient()
    });
});

function adminTool(){
    document.location.href='/admin';
}
$(document).ready(function() {
    $( "#admin_tool" ).click(function() {
        adminTool()
    });
});

function printBtn(){

    window.print();
    return false;
}

function invisibleBtn(){
    {document.getElementById("print_button").style.display="none";}
}

$(document).ready(function() {
    $( "#print_button" ).click(function() {
        invisibleBtn();
        printBtn();
    });
});

function storesTool(){
    document.location.href='/materials';
}
$(document).ready(function() {
    $( "#move_to_store" ).click(function() {
        storesTool()
    });
});

function everydayList(){
    document.location.href='/everyday_lists';
}
$(document).ready(function() {
    $( "#move_to_everyday_list" ).click(function() {
        everydayList()
    });
});
