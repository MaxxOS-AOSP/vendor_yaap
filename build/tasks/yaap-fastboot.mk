MAXX_FASTBOOT_PACKAGE := $(PRODUCT_OUT)/MaxxOS-$(MAXX_VERSION)-img.zip

.PHONY: updatepackage yaap-fastboot
updatepackage: $(INTERNAL_UPDATE_PACKAGE_TARGET)
yaap-fastboot: updatepackage
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(MAXX_FASTBOOT_PACKAGE)
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}YAAP${txtrst}";
	@echo -e "	:::   :::   :::         :::     :::::::::  "
	@echo -e "	:+:   :+: :+: :+:     :+: :+:   :+:    :+: "
	@echo -e "	 +:+ +:+ +:+   +:+   +:+   +:+  +:+    +:+ "
	@echo -e "	  +#++: +#++:++#++: +#++:++#++: +#++:++#+  "
	@echo -e "	   +#+  +#+     +#+ +#+     +#+ +#+        "
	@echo -e "	   #+#  #+#     #+# #+#     #+# #+#        "
	@echo -e "	   ###  ###     ### ###     ### ###        "
	@echo -e "		Yet Another AOSP Project			   "
	@echo -e ""
	@echo -e "zip: "$(MAXX_FASTBOOT_PACKAGE)
	@echo -e "size: `ls -lah $(MAXX_FASTBOOT_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""
