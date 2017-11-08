$(document).ready(function () {
  $('#patient_select').on('change', function() {
    //Get the selected patients HCN
    let selected = $('option:selected').attr('id');
    let patients = !{JSON.stringify(patients)};


    //get patient info from array by patient HCN
    let patient = $.grep(patients, function(patient){
       return patient.Hcn == selected;
    })[0];

    $('#name').innerHTML(patient.PName);
    $('#rno').innerHTML(patient.Rno);

  });

  $('select').material_select();
});
