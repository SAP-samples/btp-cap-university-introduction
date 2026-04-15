sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"studentsmanagement/test/integration/pages/StudentsList",
	"studentsmanagement/test/integration/pages/StudentsObjectPage"
], function (JourneyRunner, StudentsList, StudentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('studentsmanagement') + '/test/flpSandbox.html#studentsmanagement-tile',
        pages: {
			onTheStudentsList: StudentsList,
			onTheStudentsObjectPage: StudentsObjectPage
        },
        async: true
    });

    return runner;
});

