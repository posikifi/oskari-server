package fi.nls.oskari.util;


import fi.mml.map.mapwindow.service.db.CapabilitiesCacheService;
import fi.mml.map.mapwindow.service.db.CapabilitiesCacheServiceIbatisImpl;
import fi.mml.map.mapwindow.service.db.InspireThemeService;
import fi.mml.map.mapwindow.service.db.InspireThemeServiceIbatisImpl;
import fi.mml.portti.service.db.permissions.PermissionsService;
import fi.mml.portti.service.db.permissions.PermissionsServiceIbatisImpl;
import fi.mml.portti.service.search.SearchService;
import fi.mml.portti.service.search.SearchServiceImpl;
import fi.nls.oskari.map.layer.LayerGroupService;
import fi.nls.oskari.map.layer.LayerGroupServiceIbatisImpl;
import fi.nls.oskari.map.layer.OskariLayerService;
import fi.nls.oskari.map.layer.OskariLayerServiceIbatisImpl;

public class ServiceFactory {
	
	private static LayerGroupService layerGroupService;
	private static OskariLayerService mapLayerService;
	private static InspireThemeService inspireThemeService;
    private static PermissionsService permissionsService;
    private static SearchService searchService;
    private static CapabilitiesCacheService capabilitiesCacheService;
 
	public static LayerGroupService getLayerGroupService() {
		if (layerGroupService == null) {
            layerGroupService = new LayerGroupServiceIbatisImpl();
		}
		return layerGroupService;
	}
	
	public static OskariLayerService getMapLayerService() {
		if (mapLayerService == null) {
			mapLayerService = new OskariLayerServiceIbatisImpl();
		}
		return mapLayerService;
	}

	public static InspireThemeService getInspireThemeService() {
		if (inspireThemeService == null) {
			inspireThemeService = new InspireThemeServiceIbatisImpl();
		}
		return inspireThemeService;
	}
    public static PermissionsService getPermissionsService() {
        if (permissionsService == null) {
            permissionsService = new PermissionsServiceIbatisImpl();
        }
        return permissionsService;
    }

    public static SearchService getSearchService() {
        if (searchService == null) {
            searchService = new SearchServiceImpl();
        }
        return searchService;
    }

    public static CapabilitiesCacheService getCapabilitiesCacheService() {
        if (capabilitiesCacheService == null) {
            capabilitiesCacheService = new CapabilitiesCacheServiceIbatisImpl();
        }
        return capabilitiesCacheService;
    }
}
