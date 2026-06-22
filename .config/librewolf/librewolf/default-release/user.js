// Disable JIT
user_pref("javascript.options.jit.chrome", false);
user_pref("javascript.options.jit.content", false);
user_pref("javascript.options.baselinejit", false);
user_pref("javascript.options.ion", false);

// Set Custom Font
user_pref("font.name.serif.x-western", "0xProto Nerd Font");

// Disable middlemouse paste
user_pref("middlemouse.paste", false);

// Privacy
user_pref("privacy.fingerprintingProtection", true);
user_pref("privacy.fingerprintingProtection.overrides", "+AllTargets,-CSSPrefersColorScheme,-JSDateTimeUTC");
user_pref("privacy.clearOnShutdown_v2.cache", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);
user_pref("privacy.clearSiteData.cookiesAndStorage", true);

// Enable canvas prompts
user_pref("privacy.resistFingerprinting.autoDeclineNoUserInputCanvasPrompts", false);
