package egovframework.itman.asset.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AssetController {

    @RequestMapping("/itman/assetsList.do")
    public String assetsList(Model model) {
        return "itman/public/html/ingroup/assetsList";
    }
}
