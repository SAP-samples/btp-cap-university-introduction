sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"studiesmanagement/test/integration/pages/StudiesList",
	"studiesmanagement/test/integration/pages/StudiesObjectPage"
], function (JourneyRunner, StudiesList, StudiesObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('studiesmanagement') + '/test/flpSandbox.html#studiesmanagement-tile',
        pages: {
			onTheStudiesList: StudiesList,
			onTheStudiesObjectPage: StudiesObjectPage
        },
        async: true
    });

    return runner;
});

