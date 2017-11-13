$(document).ready(function () {
	$('#patient_select').on('change', function () {
		//Get the selected patients HCN
		let selected = $('option:selected').attr('id');
		let patients = JSON.stringify(patients);


		//get patient info from array by patient HCN
		let patient = $.grep(patients, function (patient) {
			return patient.Hcn == selected;
		})[0];

		$('#name').html('Patient Name: ' + patient.PName);
		$('#room').html('Room #' + patient.Rno + ': ' + patient.RName);

	});

	$('select').material_select();
});