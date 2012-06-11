@Assets(
        scripts = {
                @Script(src = "js/jquery-1.7.1.min.js")
        }
)

@Application
@Portlet package org.gatein.portal.{{name}};

import juzu.Application;
import juzu.plugin.asset.Assets;
import juzu.plugin.asset.Script;
import juzu.plugin.portlet.Portlet;

