sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"modulemanagement/test/integration/pages/ModulesList",
	"modulemanagement/test/integration/pages/ModulesObjectPage",
	"modulemanagement/test/integration/pages/StudentModuleAssignmentObjectPage"
], function (JourneyRunner, ModulesList, ModulesObjectPage, StudentModuleAssignmentObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('modulemanagement') + '/test/flpSandbox.html#modulemanagement-tile',
        pages: {
			onTheModulesList: ModulesList,
			onTheModulesObjectPage: ModulesObjectPage,
			onTheStudentModuleAssignmentObjectPage: StudentModuleAssignmentObjectPage
        },
        async: true
    });

    return runner;
});

