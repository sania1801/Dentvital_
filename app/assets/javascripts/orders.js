
$(document).ready(function() {
    $( "#service_materials" ).click(function() {
         document.location.href='/service_materials';
    });
});

$(document).ready(function() {
    $( "#new_patient" ).click(function() {
        document.location.href='/patients/new';
    });
});

$(document).ready(function() {
    $( "#all_patient" ).click(function() {
        document.location.href='/patients';
    });
});

$(document).ready(function() {
    $( "#admin_tool" ).click(function() {
        document.location.href='/admin';
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

$(document).ready(function() {
    $( "#move_to_store" ).click(function() {
       document.location.href='/materials';
    });
});

$(document).ready(function() {
    $( "#move_to_everyday_list" ).click(function() {
        document.location.href='/everyday_lists';
    });
});
