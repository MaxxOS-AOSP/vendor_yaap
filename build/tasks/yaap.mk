MAXX_TARGET_PACKAGE := $(PRODUCT_OUT)/MaxxOS-$(MAXX_VERSION).zip
SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: otapackage yaap bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
yaap: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(MAXX_TARGET_PACKAGE)
	$(hide) $(SHA256) $(MAXX_TARGET_PACKAGE) | cut -d ' ' -f1 > $(MAXX_TARGET_PACKAGE).sha256sum
	$(hide) source ./vendor/yaap/tools/generate_json_build_info.sh $(MAXX_TARGET_PACKAGE)
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
	@echo -e "zip: "$(MAXX_TARGET_PACKAGE)
	@echo -e "sha256: `cat $(MAXX_TARGET_PACKAGE).sha256sum | cut -d ' ' -f 1`"
	@echo -e "size: `ls -lah $(MAXX_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: yaap
