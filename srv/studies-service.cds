using {sap.cap.university as uni} from '../db/schema';

@odata @mcp
service StudiesService {
        @odata.draft.enabled
        entity Studies as projection on uni.Studies;
}
