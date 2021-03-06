-- NOTE! Terms of use are listed in here;
-- http://www.suomi.fi/suomifi/tyohuone/yhteiset_palvelut/palvelukartta/palvelukartan_rajapintakuvaus/palvelukartan_aineiston_kayttoehdot/index.html ;
-- THIS IS AN EXAMPLE FOR ADDING WFS LAYER ;

-- add map layer;
INSERT INTO oskari_maplayer(type, name, groupId,
                            minscale, maxscale,
                            url, locale)
  VALUES('wfslayer', 'palvelupisteiden_kyselypalvelu', (SELECT MAX(id) FROM oskari_layergroup),
         300000, 1,
         'wfs', '{fi:{name:"Palvelupisteiden kyselypalvelu", subtitle:""},sv:{name:"Söktjänst för serviceställen", subtitle:""},en:{name:"Public services query service", subtitle:""}}');

-- link to inspire theme;
INSERT INTO oskari_maplayer_themes(maplayerid,
                                   themeid)
  VALUES((SELECT MAX(id) FROM oskari_maplayer),
         (SELECT id FROM portti_inspiretheme WHERE locale LIKE '%Population distribution - demography%'));

-- add wfs specific layer data;
  INSERT INTO portti_wfs_layer ( maplayer_id, layer_name, url, username, password, gml_geometry_property, 
    gml_version, gml2_separator, wfs_version, max_features, feature_namespace, wfs_template_model_id, properties, 
    feature_type, selected_feature_params, feature_params_locales, geometry_type, selection_sld_style_id, get_map_tiles, 
    get_feature_info, tile_request, wms_layer_id, srs_name, feature_element, feature_namespace_uri, geometry_namespace_uri, get_highlight_image, 
    wps_params, tile_buffer, schema_status, custom_parser, test_location, test_zoom) 
    VALUES ( (select id from oskari_maplayer where name = 'palvelupisteiden_kyselypalvelu'),
      'palvelupisteiden_kyselypalvelu',
       'http://kartta.suomi.fi/geoserver/wfs', '', '', 'the_geom', '3.1.1', false, '1.1.0', 1000, 'pkartta', NULL, '', 
       '{}', '{}', '{}', '2d', NULL, true, true, false, NULL, 'EPSG:3067', 'toimipaikat', 'www.pkartta.fi', '', true, '{}', '{}', 
       'fail - no response', false, '[]', 9);


-- add layer as resource for mapping permissions;
INSERT INTO oskari_resource(resource_type, resource_mapping) values ('maplayer', 'wfs+palvelupisteiden_kyselypalvelu');

-- give view_layer permission for the resource to ROLE 10110 (guest);
INSERT INTO oskari_permission(oskari_resource_id, external_type, permission, external_id) values
((SELECT id FROM oskari_resource WHERE resource_type = 'maplayer' AND resource_mapping = 'wfs+palvelupisteiden_kyselypalvelu'), 'ROLE', 'VIEW_LAYER', 10110);

-- give view_layer permission for the resource to ROLE 2 (user);
INSERT INTO oskari_permission(oskari_resource_id, external_type, permission, external_id) values
((SELECT id FROM oskari_resource WHERE resource_type = 'maplayer' AND resource_mapping = 'wfs+palvelupisteiden_kyselypalvelu'), 'ROLE', 'VIEW_LAYER', 2);

-- give view_layer permission for the resource to ROLE 3 (admin);
INSERT INTO oskari_permission(oskari_resource_id, external_type, permission, external_id) values
((SELECT id FROM oskari_resource WHERE resource_type = 'maplayer' AND resource_mapping = 'wfs+palvelupisteiden_kyselypalvelu'), 'ROLE', 'VIEW_LAYER', 3);

