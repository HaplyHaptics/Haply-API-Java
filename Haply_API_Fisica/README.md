





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
  <link rel="dns-prefetch" href="https://github.githubassets.com">
  <link rel="dns-prefetch" href="https://avatars0.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars1.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars2.githubusercontent.com">
  <link rel="dns-prefetch" href="https://avatars3.githubusercontent.com">
  <link rel="dns-prefetch" href="https://github-cloud.s3.amazonaws.com">
  <link rel="dns-prefetch" href="https://user-images.githubusercontent.com/">



  <link crossorigin="anonymous" media="all" integrity="sha512-HlgX4s+P4ikUGWRu6fvWIVak24jAHDOE7IzlHFtcW54px5zDZvAXO8xY42wXJNZ7PChlgxFwwdMH4tyMFCop6g==" rel="stylesheet" href="https://github.githubassets.com/assets/frameworks-2322f54af916007dd939df6c24bd2264.css" />
  
    <link crossorigin="anonymous" media="all" integrity="sha512-LwR2xo3omZuUPnwBNvInAvZE2+tT3Jj3Jv79G+lLPkNbzuISePC/vJxzx3GcaUtWGMyCvTiRPLGKt5IVub/amA==" rel="stylesheet" href="https://github.githubassets.com/assets/github-ef1f60313b8a6973418f488958f8b257.css" />
    
    
    
    

  <meta name="viewport" content="width=device-width">
  
  <title>hAPI_Fisica/README.md at master · HaplyHaptics/hAPI_Fisica</title>
    <meta name="description" content="Here is the code developed for use with a processing physics engine to wrap jbox2d to work in processing with the Haply. It is based on work that was developed by Ricard Marxer .  - HaplyHaptics/hAPI_Fisica">
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
  <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
  <meta property="fb:app_id" content="1401488693436528">

    
    <meta property="og:image" content="https://avatars3.githubusercontent.com/u/25597966?s=400&amp;v=4" /><meta property="og:site_name" content="GitHub" /><meta property="og:type" content="object" /><meta property="og:title" content="HaplyHaptics/hAPI_Fisica" /><meta property="og:url" content="https://github.com/HaplyHaptics/hAPI_Fisica" /><meta property="og:description" content="Here is the code developed for use with a processing physics engine to wrap jbox2d to work in processing with the Haply. It is based on work that was developed by Ricard Marxer .  - HaplyHaptics/hA..." />

  <link rel="assets" href="https://github.githubassets.com/">
  <link rel="web-socket" href="wss://live.github.com/_sockets/VjI6Mzc4MDM1NDQ5OmNjMzM3NmI1ZTNlNDUxOWUzYWIyNjcwNTNhODk0ZmFiYmZlM2UwMzMxYTYzZTA5MjI3M2Y4NzE5MTkxYmUwYmY=--c60e82ac49e9ee12b67dcd47400b637b8a87b8a6">
  <meta name="pjax-timeout" content="1000">
  <link rel="sudo-modal" href="/sessions/sudo_modal">
  <meta name="request-id" content="D593:2234:0328:01A8:5CAE388E" data-pjax-transient>


  

  <meta name="selected-link" value="repo_source" data-pjax-transient>

      <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-site-verification" content="GXs5KoUUkNCoaAZn7wPN-t01Pywp9M3sEjnt_3_ZWPc">

  <meta name="octolytics-host" content="collector.githubapp.com" /><meta name="octolytics-app-id" content="github" /><meta name="octolytics-event-url" content="https://collector.githubapp.com/github-external/browser_event" /><meta name="octolytics-dimension-request_id" content="D593:2234:0328:01A8:5CAE388E" /><meta name="octolytics-dimension-region_edge" content="iad" /><meta name="octolytics-dimension-region_render" content="iad" /><meta name="octolytics-actor-id" content="1916741" /><meta name="octolytics-actor-login" content="ehymowitz" /><meta name="octolytics-actor-hash" content="f2dec65176e6f7ad91398b0a94d55e0bec7ff69a78564ace23de2db3ba882463" />
<meta name="analytics-location" content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" />



    <meta name="google-analytics" content="UA-3769691-2">

  <meta class="js-ga-set" name="userId" content="2a0b2fdc716ebd16683658baef0e29c5">

<meta class="js-ga-set" name="dimension1" content="Logged In">



  

      <meta name="hostname" content="github.com">
    <meta name="user-login" content="ehymowitz">

      <meta name="expected-hostname" content="github.com">
    <meta name="js-proxy-site-detection-payload" content="M2NlNmE3MTI3MWFjMjgyMTUwY2UyY2JmZmQyNTM0MDMxNmMwMTIzNzJhZTU1ZWUzZjc2YmM4NzEwNDMzZWY4M3x7InJlbW90ZV9hZGRyZXNzIjoiMTk4Ljg0LjI1My4xMDMiLCJyZXF1ZXN0X2lkIjoiRDU5MzoyMjM0OjAzMjg6MDFBODo1Q0FFMzg4RSIsInRpbWVzdGFtcCI6MTU1NDkyMTYyMSwiaG9zdCI6ImdpdGh1Yi5jb20ifQ==">

    <meta name="enabled-features" content="UNIVERSE_BANNER,MARKETPLACE_INVOICED_BILLING,MARKETPLACE_ENTERPRISE_CONTACTS,MARKETPLACE_SOCIAL_PROOF_CUSTOMERS,MARKETPLACE_TRENDING_SOCIAL_PROOF,MARKETPLACE_RECOMMENDATIONS,NOTIFY_ON_BLOCK,RELATED_ISSUES">

  <meta name="html-safe-nonce" content="2fa7f5be5caa28c5835301abde0ebe03fd3ac296">

  <meta http-equiv="x-pjax-version" content="b68d10377ae8a761029d29c46f20375c">
  

      <link href="https://github.com/HaplyHaptics/hAPI_Fisica/commits/master.atom" rel="alternate" title="Recent Commits to hAPI_Fisica:master" type="application/atom+xml">

  <meta name="go-import" content="github.com/HaplyHaptics/hAPI_Fisica git https://github.com/HaplyHaptics/hAPI_Fisica.git">

  <meta name="octolytics-dimension-user_id" content="25597966" /><meta name="octolytics-dimension-user_login" content="HaplyHaptics" /><meta name="octolytics-dimension-repository_id" content="90829517" /><meta name="octolytics-dimension-repository_nwo" content="HaplyHaptics/hAPI_Fisica" /><meta name="octolytics-dimension-repository_public" content="true" /><meta name="octolytics-dimension-repository_is_fork" content="false" /><meta name="octolytics-dimension-repository_network_root_id" content="90829517" /><meta name="octolytics-dimension-repository_network_root_nwo" content="HaplyHaptics/hAPI_Fisica" /><meta name="octolytics-dimension-repository_explore_github_marketplace_ci_cta_shown" content="false" />


    <link rel="canonical" href="https://github.com/HaplyHaptics/hAPI_Fisica/blob/master/README.md" data-pjax-transient>


  <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">

  <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">

  <link rel="mask-icon" href="https://github.githubassets.com/pinned-octocat.svg" color="#000000">
  <link rel="icon" type="image/x-icon" class="js-site-favicon" href="https://github.githubassets.com/favicon.ico">

<meta name="theme-color" content="#1e2327">


  <meta name="u2f-enabled" content="true">


  <link rel="manifest" href="/manifest.json" crossOrigin="use-credentials">

  </head>

  <body class="logged-in env-production emoji-size-boost page-blob">
    

  <div class="position-relative js-header-wrapper ">
    <a href="#start-of-content" tabindex="1" class="p-3 bg-blue text-white show-on-focus js-skip-to-content">Skip to content</a>
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"><div class="progress"></div></div>

    
    
    


        
  <header class="Header" role="banner">

    <div class="Header-item">
      <a class="Header-link" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <svg class="octicon octicon-mark-github v-align-middle" height="32" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>

    </div>


    <div class="Header-item Header-item--full">
        <div class="header-search mr-3 scoped-search site-scoped-search js-site-search position-relative js-jump-to"
  role="combobox"
  aria-owns="jump-to-results"
  aria-label="Search or jump to"
  aria-haspopup="listbox"
  aria-expanded="false"
>
  <div class="position-relative">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-site-search-form" role="search" aria-label="Site" data-scope-type="Repository" data-scope-id="90829517" data-scoped-search-url="/HaplyHaptics/hAPI_Fisica/search" data-unscoped-search-url="/search" action="/HaplyHaptics/hAPI_Fisica/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
      <label class="form-control input-sm header-search-wrapper p-0 header-search-wrapper-jump-to position-relative d-flex flex-justify-between flex-items-center js-chromeless-input-container">
        <input type="text"
          class="form-control input-sm header-search-input jump-to-field js-jump-to-field js-site-search-focus js-site-search-field is-clearable"
          data-hotkey="s,/"
          name="q"
          value=""
          placeholder="Search or jump to…"
          data-unscoped-placeholder="Search or jump to…"
          data-scoped-placeholder="Search or jump to…"
          autocapitalize="off"
          aria-autocomplete="list"
          aria-controls="jump-to-results"
          aria-label="Search or jump to…"
          data-jump-to-suggestions-path="/_graphql/GetSuggestedNavigationDestinations#csrf-token=vvDPD/UZGAzP/h9v5IK3/ZKhFHN6gTkz7K6fdc1rpyupXXAtFulQjElg18f/4N3nt23zFNtxwp3i3U9r0rBAkA=="
          spellcheck="false"
          autocomplete="off"
          >
          <input type="hidden" class="js-site-search-type-field" name="type" >
            <img src="https://github.githubassets.com/images/search-key-slash.svg" alt="" class="mr-2 header-search-key-slash">

            <div class="Box position-absolute overflow-hidden d-none jump-to-suggestions js-jump-to-suggestions-container">
              
<ul class="d-none js-jump-to-suggestions-template-container">
  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-suggestion" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>

</ul>

<ul class="d-none js-jump-to-no-results-template-container">
  <li class="d-flex flex-justify-center flex-items-center f5 d-none js-jump-to-suggestion p-2">
    <span class="text-gray">No suggested jump to results</span>
  </li>
</ul>

<ul id="jump-to-results" role="listbox" class="p-0 m-0 js-navigation-container jump-to-suggestions-results-container js-jump-to-suggestions-results-container">
  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-scoped-search d-none" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>

  

<li class="d-flex flex-justify-start flex-items-center p-0 f5 navigation-item js-navigation-item js-jump-to-global-search d-none" role="option">
  <a tabindex="-1" class="no-underline d-flex flex-auto flex-items-center jump-to-suggestions-path js-jump-to-suggestion-path js-navigation-open p-2" href="">
    <div class="jump-to-octicon js-jump-to-octicon flex-shrink-0 mr-2 text-center d-none">
      <svg height="16" width="16" class="octicon octicon-repo flex-shrink-0 js-jump-to-octicon-repo d-none" title="Repository" aria-label="Repository" viewBox="0 0 12 16" version="1.1" role="img"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-project flex-shrink-0 js-jump-to-octicon-project d-none" title="Project" aria-label="Project" viewBox="0 0 15 16" version="1.1" role="img"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      <svg height="16" width="16" class="octicon octicon-search flex-shrink-0 js-jump-to-octicon-search d-none" title="Search" aria-label="Search" viewBox="0 0 16 16" version="1.1" role="img"><path fill-rule="evenodd" d="M15.7 13.3l-3.81-3.83A5.93 5.93 0 0 0 13 6c0-3.31-2.69-6-6-6S1 2.69 1 6s2.69 6 6 6c1.3 0 2.48-.41 3.47-1.11l3.83 3.81c.19.2.45.3.7.3.25 0 .52-.09.7-.3a.996.996 0 0 0 0-1.41v.01zM7 10.7c-2.59 0-4.7-2.11-4.7-4.7 0-2.59 2.11-4.7 4.7-4.7 2.59 0 4.7 2.11 4.7 4.7 0 2.59-2.11 4.7-4.7 4.7z"/></svg>
    </div>

    <img class="avatar mr-2 flex-shrink-0 js-jump-to-suggestion-avatar d-none" alt="" aria-label="Team" src="" width="28" height="28">

    <div class="jump-to-suggestion-name js-jump-to-suggestion-name flex-auto overflow-hidden text-left no-wrap css-truncate css-truncate-target">
    </div>

    <div class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none js-jump-to-badge-search">
      <span class="js-jump-to-badge-search-text-default d-none" aria-label="in this repository">
        In this repository
      </span>
      <span class="js-jump-to-badge-search-text-global d-none" aria-label="in all of GitHub">
        All GitHub
      </span>
      <span aria-hidden="true" class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>

    <div aria-hidden="true" class="border rounded-1 flex-shrink-0 bg-gray px-1 text-gray-light ml-1 f6 d-none d-on-nav-focus js-jump-to-badge-jump">
      Jump to
      <span class="d-inline-block ml-1 v-align-middle">↵</span>
    </div>
  </a>
</li>


    <li class="d-flex flex-justify-center flex-items-center p-0 f5 js-jump-to-suggestion">
      <img src="https://github.githubassets.com/images/spinners/octocat-spinner-128.gif" alt="Octocat Spinner Icon" class="m-2" width="28">
    </li>
</ul>

            </div>
      </label>
</form>  </div>
</div>


      <nav class="d-flex" aria-label="Global">

  <a class="js-selected-navigation-item Header-link  mr-3" data-hotkey="g p" data-ga-click="Header, click, Nav menu - item:pulls context:user" aria-label="Pull requests you created" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls" href="/pulls">
    Pull requests
</a>
  <a class="js-selected-navigation-item Header-link  mr-3" data-hotkey="g i" data-ga-click="Header, click, Nav menu - item:issues context:user" aria-label="Issues you created" data-selected-links="/issues /issues/assigned /issues/mentioned /issues" href="/issues">
    Issues
</a>
    <a class="js-selected-navigation-item Header-link  mr-3" data-ga-click="Header, click, Nav menu - item:marketplace context:user" data-octo-click="marketplace_click" data-octo-dimensions="location:nav_bar" data-selected-links=" /marketplace" href="/marketplace">
      Marketplace
</a>      

  <a class="js-selected-navigation-item Header-link  mr-3" data-ga-click="Header, click, Nav menu - item:explore" data-selected-links="/explore /trending /trending/developers /integrations /integrations/feature/code /integrations/feature/collaborate /integrations/feature/ship showcases showcases_search showcases_landing /explore" href="/explore">
    Explore
</a>
</nav>

    </div>


    <div class="Header-item">
      
    <a aria-label="You have no unread notifications" class="Header-link notification-indicator tooltipped tooltipped-s  js-socket-channel js-notification-indicator" data-hotkey="g n" data-ga-click="Header, go to notifications, icon:read" data-channel="notification-changed:1916741" href="/notifications">
        <span class="mail-status "></span>
        <svg class="octicon octicon-bell" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 12v1H0v-1l.73-.58c.77-.77.81-2.55 1.19-4.42C2.69 3.23 6 2 6 2c0-.55.45-1 1-1s1 .45 1 1c0 0 3.39 1.23 4.16 5 .38 1.88.42 3.66 1.19 4.42l.66.58H14zm-7 4c1.11 0 2-.89 2-2H5c0 1.11.89 2 2 2z"/></svg>
</a>
    </div>


    <div class="Header-item position-relative">
      <details class="details-overlay details-reset">
  <summary class="Header-link"
      aria-label="Create new…"
      data-ga-click="Header, create new, icon:add">
    <svg class="octicon octicon-plus" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 9H7v5H5V9H0V7h5V2h2v5h5v2z"/></svg> <span class="dropdown-caret"></span>
  </summary>
  <details-menu class="dropdown-menu dropdown-menu-sw">
    
<a role="menuitem" class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>

  <a role="menuitem" class="dropdown-item" href="/new/import" data-ga-click="Header, import a repository">
    Import repository
  </a>

<a role="menuitem" class="dropdown-item" href="https://gist.github.com/" data-ga-click="Header, create new gist">
  New gist
</a>

  <a role="menuitem" class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>


  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="HaplyHaptics/hAPI_Fisica">This repository</span>
  </div>
    <a role="menuitem" class="dropdown-item" href="/HaplyHaptics/hAPI_Fisica/issues/new" data-ga-click="Header, create new issue" data-skip-pjax>
      New issue
    </a>


  </details-menu>
</details>

    </div>

    <div class="Header-item position-relative mr-0">
      
<details class="details-overlay details-reset">
  <summary class="Header-link"
    aria-label="View profile and more"
    data-ga-click="Header, show menu, icon:avatar">
    <img alt="@ehymowitz" class="avatar" src="https://avatars2.githubusercontent.com/u/1916741?s=40&amp;v=4" height="20" width="20">
    <span class="dropdown-caret"></span>
  </summary>
  <details-menu class="dropdown-menu dropdown-menu-sw mt-2" style="width: 180px">
    <div class="header-nav-current-user css-truncate"><a role="menuitem" class="no-underline user-profile-link px-3 pt-2 pb-2 mb-n2 mt-n1 d-block" href="/ehymowitz" data-ga-click="Header, go to profile, text:Signed in as">Signed in as <strong class="css-truncate-target">ehymowitz</strong></a></div>
    <div role="none" class="dropdown-divider"></div>

    <div class="pl-3 pr-5 f6 user-status-container js-user-status-context pb-1" data-url="/users/status?compact=1&amp;link_mentions=0&amp;truncate=1">
      
<div class="js-user-status-container user-status-compact" data-team-hovercards-enabled>
  <details class="js-user-status-details details-reset details-overlay details-overlay-dark">
    <summary class="btn-link no-underline js-toggle-user-status-edit toggle-user-status-edit width-full " aria-haspopup="dialog" role="menuitem" data-hydro-click="{&quot;event_type&quot;:&quot;user_profile.click&quot;,&quot;payload&quot;:{&quot;profile_user_id&quot;:25597966,&quot;target&quot;:&quot;EDIT_USER_STATUS&quot;,&quot;user_id&quot;:1916741,&quot;client_id&quot;:&quot;1702687968.1523289919&quot;,&quot;originating_request_id&quot;:&quot;D593:2234:0328:01A8:5CAE388E&quot;,&quot;originating_url&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica/blob/master/README.md&quot;,&quot;referrer&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica&quot;}}" data-hydro-click-hmac="5c02cbcc24e1fcf6a86ceb2a22ebc50c10549fe3f1fc962770433967f0a33123">
      <div class="f6 d-inline-block v-align-middle  user-status-emoji-only-header pl-0 circle lh-condensed user-status-header " style="max-width: 29px">
        <div class="user-status-emoji-container flex-shrink-0 mr-1">
          <svg class="octicon octicon-smiley" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8s3.58 8 8 8 8-3.58 8-8-3.58-8-8-8zm4.81 12.81a6.72 6.72 0 0 1-2.17 1.45c-.83.36-1.72.53-2.64.53-.92 0-1.81-.17-2.64-.53-.81-.34-1.55-.83-2.17-1.45a6.773 6.773 0 0 1-1.45-2.17A6.59 6.59 0 0 1 1.21 8c0-.92.17-1.81.53-2.64.34-.81.83-1.55 1.45-2.17.62-.62 1.36-1.11 2.17-1.45A6.59 6.59 0 0 1 8 1.21c.92 0 1.81.17 2.64.53.81.34 1.55.83 2.17 1.45.62.62 1.11 1.36 1.45 2.17.36.83.53 1.72.53 2.64 0 .92-.17 1.81-.53 2.64-.34.81-.83 1.55-1.45 2.17zM4 6.8v-.59c0-.66.53-1.19 1.2-1.19h.59c.66 0 1.19.53 1.19 1.19v.59c0 .67-.53 1.2-1.19 1.2H5.2C4.53 8 4 7.47 4 6.8zm5 0v-.59c0-.66.53-1.19 1.2-1.19h.59c.66 0 1.19.53 1.19 1.19v.59c0 .67-.53 1.2-1.19 1.2h-.59C9.53 8 9 7.47 9 6.8zm4 3.2c-.72 1.88-2.91 3-5 3s-4.28-1.13-5-3c-.14-.39.23-1 .66-1h8.59c.41 0 .89.61.75 1z"/></svg>
        </div>
      </div>
      <div class="d-inline-block v-align-middle user-status-message-wrapper f6 lh-condensed ws-normal pt-1">
          <span class="link-gray">Set your status</span>
      </div>
</summary>    <details-dialog class="details-dialog rounded-1 anim-fade-in fast Box Box--overlay" role="dialog" tabindex="-1">
      <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="position-relative flex-auto js-user-status-form" action="/users/status?compact=1&amp;link_mentions=0&amp;truncate=1" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="_method" value="put" /><input type="hidden" name="authenticity_token" value="U9XLRF9cxrpnM/rMLOd/rb2q34HNC6+xVQ2DpUT5OzoBodZve8nlbR30hFrJNi3xnjzAIpxcFcFulexTCVOf3g==" />
        <div class="Box-header bg-gray border-bottom p-3">
          <button class="Box-btn-octicon js-toggle-user-status-edit btn-octicon float-right" type="reset" aria-label="Close dialog" data-close-dialog>
            <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
          </button>
          <h3 class="Box-title f5 text-bold text-gray-dark">Edit status</h3>
        </div>
        <input type="hidden" name="emoji" class="js-user-status-emoji-field" value="">
        <input type="hidden" name="organization_id" class="js-user-status-org-id-field" value="">
        <div class="px-3 py-2 text-gray-dark">
          <div class="js-characters-remaining-container js-suggester-container position-relative mt-2">
            <div class="input-group d-table form-group my-0 js-user-status-form-group">
              <span class="input-group-button d-table-cell v-align-middle" style="width: 1%">
                <button type="button" aria-label="Choose an emoji" class="btn-outline btn js-toggle-user-status-emoji-picker btn-open-emoji-picker">
                  <span class="js-user-status-original-emoji" hidden></span>
                  <span class="js-user-status-custom-emoji"></span>
                  <span class="js-user-status-no-emoji-icon" >
                    <svg class="octicon octicon-smiley" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8s3.58 8 8 8 8-3.58 8-8-3.58-8-8-8zm4.81 12.81a6.72 6.72 0 0 1-2.17 1.45c-.83.36-1.72.53-2.64.53-.92 0-1.81-.17-2.64-.53-.81-.34-1.55-.83-2.17-1.45a6.773 6.773 0 0 1-1.45-2.17A6.59 6.59 0 0 1 1.21 8c0-.92.17-1.81.53-2.64.34-.81.83-1.55 1.45-2.17.62-.62 1.36-1.11 2.17-1.45A6.59 6.59 0 0 1 8 1.21c.92 0 1.81.17 2.64.53.81.34 1.55.83 2.17 1.45.62.62 1.11 1.36 1.45 2.17.36.83.53 1.72.53 2.64 0 .92-.17 1.81-.53 2.64-.34.81-.83 1.55-1.45 2.17zM4 6.8v-.59c0-.66.53-1.19 1.2-1.19h.59c.66 0 1.19.53 1.19 1.19v.59c0 .67-.53 1.2-1.19 1.2H5.2C4.53 8 4 7.47 4 6.8zm5 0v-.59c0-.66.53-1.19 1.2-1.19h.59c.66 0 1.19.53 1.19 1.19v.59c0 .67-.53 1.2-1.19 1.2h-.59C9.53 8 9 7.47 9 6.8zm4 3.2c-.72 1.88-2.91 3-5 3s-4.28-1.13-5-3c-.14-.39.23-1 .66-1h8.59c.41 0 .89.61.75 1z"/></svg>
                  </span>
                </button>
              </span>
              <input type="text" autocomplete="off" data-maxlength="80" class="js-suggester-field d-table-cell width-full form-control js-user-status-message-field js-characters-remaining-field" placeholder="What's happening?" name="message" required value="" aria-label="What is your current status?">
              <div class="error">Could not update your status, please try again.</div>
            </div>
            <div class="suggester-container">
              <div class="suggester js-suggester js-navigation-container" data-url="/autocomplete/user-suggestions" data-no-org-url="/autocomplete/user-suggestions" data-org-url="/suggestions" hidden>
              </div>
            </div>
            <div style="margin-left: 53px" class="my-1 text-small label-characters-remaining js-characters-remaining" data-suffix="remaining" hidden>
              80 remaining
            </div>
          </div>
          <include-fragment class="js-user-status-emoji-picker" data-url="/users/status/emoji"></include-fragment>
          <div class="overflow-auto border-bottom ml-n3 mr-n3 px-3" style="max-height: 33vh">
            <div class="user-status-suggestions js-user-status-suggestions collapsed overflow-hidden">
              <h4 class="f6 text-normal my-3">Suggestions:</h4>
              <div class="mx-3 mt-2 clearfix">
                  <div class="float-left col-6">
                      <button type="button" value=":palm_tree:" class="d-flex flex-items-baseline flex-items-stretch lh-condensed f6 btn-link link-gray no-underline js-predefined-user-status mb-1">
                        <div class="emoji-status-width mr-2 v-align-middle js-predefined-user-status-emoji">
                          <g-emoji alias="palm_tree" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f334.png">🌴</g-emoji>
                        </div>
                        <div class="d-flex flex-items-center no-underline js-predefined-user-status-message" style="border-left: 1px solid transparent">
                          On vacation
                        </div>
                      </button>
                      <button type="button" value=":face_with_thermometer:" class="d-flex flex-items-baseline flex-items-stretch lh-condensed f6 btn-link link-gray no-underline js-predefined-user-status mb-1">
                        <div class="emoji-status-width mr-2 v-align-middle js-predefined-user-status-emoji">
                          <g-emoji alias="face_with_thermometer" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f912.png">🤒</g-emoji>
                        </div>
                        <div class="d-flex flex-items-center no-underline js-predefined-user-status-message" style="border-left: 1px solid transparent">
                          Out sick
                        </div>
                      </button>
                  </div>
                  <div class="float-left col-6">
                      <button type="button" value=":house:" class="d-flex flex-items-baseline flex-items-stretch lh-condensed f6 btn-link link-gray no-underline js-predefined-user-status mb-1">
                        <div class="emoji-status-width mr-2 v-align-middle js-predefined-user-status-emoji">
                          <g-emoji alias="house" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f3e0.png">🏠</g-emoji>
                        </div>
                        <div class="d-flex flex-items-center no-underline js-predefined-user-status-message" style="border-left: 1px solid transparent">
                          Working from home
                        </div>
                      </button>
                      <button type="button" value=":dart:" class="d-flex flex-items-baseline flex-items-stretch lh-condensed f6 btn-link link-gray no-underline js-predefined-user-status mb-1">
                        <div class="emoji-status-width mr-2 v-align-middle js-predefined-user-status-emoji">
                          <g-emoji alias="dart" fallback-src="https://github.githubassets.com/images/icons/emoji/unicode/1f3af.png">🎯</g-emoji>
                        </div>
                        <div class="d-flex flex-items-center no-underline js-predefined-user-status-message" style="border-left: 1px solid transparent">
                          Focusing
                        </div>
                      </button>
                  </div>
              </div>
            </div>
            <div class="user-status-limited-availability-container">
              <div class="form-checkbox my-0">
                <input type="checkbox" name="limited_availability" value="1" class="js-user-status-limited-availability-checkbox" data-default-message="I may be slow to respond." aria-describedby="limited-availability-help-text-truncate-true" id="limited-availability-truncate-true">
                <label class="d-block f5 text-gray-dark mb-1" for="limited-availability-truncate-true">
                  Busy
                </label>
                <p class="note" id="limited-availability-help-text-truncate-true">
                  When others mention you, assign you, or request your review,
                  GitHub will let them know that you have limited availability.
                </p>
              </div>
            </div>
          </div>
            

<div class="d-inline-block f5 mr-2 pt-3 pb-2" >
  <div class="d-inline-block mr-1">
    Clear status
  </div>

  <details class="js-user-status-expire-drop-down f6 dropdown details-reset details-overlay d-inline-block mr-2">
    <summary class="f5 btn-link link-gray-dark border px-2 py-1 rounded-1" aria-haspopup="true">
      <div class="js-user-status-expiration-interval-selected d-inline-block v-align-baseline">
        Never
      </div>
      <div class="dropdown-caret"></div>
    </summary>

    <ul class="dropdown-menu dropdown-menu-se pl-0 overflow-auto" style="width: 220px; max-height: 15.5em">
      <li>
        <button type="button" class="btn-link dropdown-item js-user-status-expire-button ws-normal" title="Never">
          <span class="d-inline-block text-bold mb-1">Never</span>
          <div class="f6 lh-condensed">Keep this status until you clear your status or edit your status.</div>
        </button>
      </li>
      <li class="dropdown-divider" role="separator"></li>
        <li>
          <button type="button" class="btn-link dropdown-item ws-normal js-user-status-expire-button" title="in 30 minutes" value="2019-04-10T15:10:21-04:00">
            in 30 minutes
          </button>
        </li>
        <li>
          <button type="button" class="btn-link dropdown-item ws-normal js-user-status-expire-button" title="in 1 hour" value="2019-04-10T15:40:21-04:00">
            in 1 hour
          </button>
        </li>
        <li>
          <button type="button" class="btn-link dropdown-item ws-normal js-user-status-expire-button" title="in 4 hours" value="2019-04-10T18:40:21-04:00">
            in 4 hours
          </button>
        </li>
        <li>
          <button type="button" class="btn-link dropdown-item ws-normal js-user-status-expire-button" title="today" value="2019-04-10T23:59:59-04:00">
            today
          </button>
        </li>
        <li>
          <button type="button" class="btn-link dropdown-item ws-normal js-user-status-expire-button" title="this week" value="2019-04-14T23:59:59-04:00">
            this week
          </button>
        </li>
    </ul>
  </details>
  <input class="js-user-status-expiration-date-input" type="hidden" name="expires_at" value="">
</div>

          <include-fragment class="js-user-status-org-picker" data-url="/users/status/organizations"></include-fragment>
        </div>
        <div class="d-flex flex-items-center flex-justify-between p-3 border-top">
          <button type="submit" disabled class="width-full btn btn-primary mr-2 js-user-status-submit">
            Set status
          </button>
          <button type="button" disabled class="width-full js-clear-user-status-button btn ml-2 ">
            Clear status
          </button>
        </div>
</form>    </details-dialog>
  </details>
</div>

    </div>
    <div role="none" class="dropdown-divider"></div>

    <a role="menuitem" class="dropdown-item" href="/ehymowitz" data-ga-click="Header, go to profile, text:your profile">Your profile</a>
    <a role="menuitem" class="dropdown-item" href="/ehymowitz?tab=repositories" data-ga-click="Header, go to repositories, text:your repositories">Your repositories</a>

    <a role="menuitem" class="dropdown-item" href="/ehymowitz?tab=projects" data-ga-click="Header, go to projects, text:your projects">Your projects</a>

    <a role="menuitem" class="dropdown-item" href="/ehymowitz?tab=stars" data-ga-click="Header, go to starred repos, text:your stars">Your stars</a>
      <a role="menuitem" class="dropdown-item" href="https://gist.github.com/" data-ga-click="Header, your gists, text:your gists">Your gists</a>

    <div role="none" class="dropdown-divider"></div>
    <a role="menuitem" class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">Help</a>
    <a role="menuitem" class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">Settings</a>
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="logout-form" action="/logout" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="x8hi0yYtTNNcdHOP1n8iU4RxFrjaPHJjdT6RtHe0Y7eyfUMm6jAPGSAUuBPDjtNnrY5wMTZLRaxUgpM4+n3Xuw==" />
      
      <button type="submit" class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout" role="menuitem">
        Sign out
      </button>
</form>  </details-menu>
</details>

    </div>

  </header>

      

  </div>

  <div id="start-of-content" class="show-on-focus"></div>

    <div id="js-flash-container">

</div>



  <div class="application-main " data-commit-hovercards-enabled>
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode" class="">
    <main id="js-repo-pjax-container" data-pjax-container >
      


  



  




  <div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav  ">
    <div class="repohead-details-container clearfix container">

      <ul class="pagehead-actions">



  <li>
    
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form data-remote="true" class="clearfix js-social-form js-social-container" action="/notifications/subscribe" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="UFzix3+ofSql7h0H3YrNGvH2KhwNFQMpulTWyTClGCd08vYE+ijRhcGVM7hXSyqnELWbFVMypsNzYCKUpbEJ9g==" />      <input type="hidden" name="repository_id" value="90829517">

      <details class="details-reset details-overlay select-menu float-left">
        <summary class="select-menu-button float-left btn btn-sm btn-with-count" data-hydro-click="{&quot;event_type&quot;:&quot;repository.click&quot;,&quot;payload&quot;:{&quot;target&quot;:&quot;WATCH_BUTTON&quot;,&quot;repository_id&quot;:90829517,&quot;client_id&quot;:&quot;1702687968.1523289919&quot;,&quot;originating_request_id&quot;:&quot;D593:2234:0328:01A8:5CAE388E&quot;,&quot;originating_url&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica/blob/master/README.md&quot;,&quot;referrer&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica&quot;,&quot;user_id&quot;:1916741}}" data-hydro-click-hmac="e408cfeab4e51e77397e27c33d2c00d2641e2c4e6ec7a8dc59d0f4d0984cb6d1" data-ga-click="Repository, click Watch settings, action:blob#show">            <span data-menu-button>
                <svg class="octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                Watch
            </span>
</summary>        <details-menu
          class="select-menu-modal position-absolute mt-5"
          style="z-index: 99; ">
          <div class="select-menu-header">
            <span class="select-menu-title">Notifications</span>
          </div>
          <div class="select-menu-list">
            <button type="submit" name="do" value="included" class="select-menu-item width-full" aria-checked="true" role="menuitemradio">
              <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
              <div class="select-menu-item-text">
                <span class="select-menu-item-heading">Not watching</span>
                <span class="description">Be notified only when participating or @mentioned.</span>
                <span class="hidden-select-button-text" data-menu-button-contents>
                  <svg class="octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                  Watch
                </span>
              </div>
            </button>

            <button type="submit" name="do" value="release_only" class="select-menu-item width-full" aria-checked="false" role="menuitemradio">
              <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
              <div class="select-menu-item-text">
                <span class="select-menu-item-heading">Releases only</span>
                <span class="description">Be notified of new releases, and when participating or @mentioned.</span>
                <span class="hidden-select-button-text" data-menu-button-contents>
                  <svg class="octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                  Unwatch releases
                </span>
              </div>
            </button>

            <button type="submit" name="do" value="subscribed" class="select-menu-item width-full" aria-checked="false" role="menuitemradio">
              <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
              <div class="select-menu-item-text">
                <span class="select-menu-item-heading">Watching</span>
                <span class="description">Be notified of all conversations.</span>
                <span class="hidden-select-button-text" data-menu-button-contents>
                  <svg class="octicon octicon-eye v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                  Unwatch
                </span>
              </div>
            </button>

            <button type="submit" name="do" value="ignore" class="select-menu-item width-full" aria-checked="false" role="menuitemradio">
              <svg class="octicon octicon-check select-menu-item-icon" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5L12 5z"/></svg>
              <div class="select-menu-item-text">
                <span class="select-menu-item-heading">Ignoring</span>
                <span class="description">Never be notified.</span>
                <span class="hidden-select-button-text" data-menu-button-contents>
                  <svg class="octicon octicon-mute v-align-text-bottom" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 2.81v10.38c0 .67-.81 1-1.28.53L3 10H1c-.55 0-1-.45-1-1V7c0-.55.45-1 1-1h2l3.72-3.72C7.19 1.81 8 2.14 8 2.81zm7.53 3.22l-1.06-1.06-1.97 1.97-1.97-1.97-1.06 1.06L11.44 8 9.47 9.97l1.06 1.06 1.97-1.97 1.97 1.97 1.06-1.06L13.56 8l1.97-1.97z"/></svg>
                  Stop ignoring
                </span>
              </div>
            </button>

          </div>
        </details-menu>
      </details>
        <a class="social-count js-social-count"
          href="/HaplyHaptics/hAPI_Fisica/watchers"
          aria-label="3 users are watching this repository">
          3
        </a>
</form>
  </li>

  <li>
      <div class="js-toggler-container js-social-container starring-container ">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="starred js-social-form" action="/HaplyHaptics/hAPI_Fisica/unstar" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="FvzNMIqUOXrku1x+w84LjsH3opMfX0DjsSGzB7+CBC1s/4iZz6K3+lqKdn5puZwBlpiJPESkEcU22KUfaciKNg==" />
      <input type="hidden" name="context" value="repository"></input>
      <button type="submit" class="btn btn-sm btn-with-count js-toggler-target" aria-label="Unstar this repository" title="Unstar HaplyHaptics/hAPI_Fisica" data-hydro-click="{&quot;event_type&quot;:&quot;repository.click&quot;,&quot;payload&quot;:{&quot;target&quot;:&quot;UNSTAR_BUTTON&quot;,&quot;repository_id&quot;:90829517,&quot;client_id&quot;:&quot;1702687968.1523289919&quot;,&quot;originating_request_id&quot;:&quot;D593:2234:0328:01A8:5CAE388E&quot;,&quot;originating_url&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica/blob/master/README.md&quot;,&quot;referrer&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica&quot;,&quot;user_id&quot;:1916741}}" data-hydro-click-hmac="64fabe8f15fbb8b8c25cd019674f670f46da8dee5931031c70b2b4ec43830b2c" data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Unstar
</button>        <a class="social-count js-social-count" href="/HaplyHaptics/hAPI_Fisica/stargazers"
           aria-label="1 user starred this repository">
          1
        </a>
</form>
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="unstarred js-social-form" action="/HaplyHaptics/hAPI_Fisica/star" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="D80DJpPduPY3nuBz3vHsbQaiSSXOCJ85dt5529WIYehAIWdajYKIUfTAIymMGyM/84r8TvMNCp690pLsQl4sgg==" />
      <input type="hidden" name="context" value="repository"></input>
      <button type="submit" class="btn btn-sm btn-with-count js-toggler-target" aria-label="Unstar this repository" title="Star HaplyHaptics/hAPI_Fisica" data-hydro-click="{&quot;event_type&quot;:&quot;repository.click&quot;,&quot;payload&quot;:{&quot;target&quot;:&quot;STAR_BUTTON&quot;,&quot;repository_id&quot;:90829517,&quot;client_id&quot;:&quot;1702687968.1523289919&quot;,&quot;originating_request_id&quot;:&quot;D593:2234:0328:01A8:5CAE388E&quot;,&quot;originating_url&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica/blob/master/README.md&quot;,&quot;referrer&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica&quot;,&quot;user_id&quot;:1916741}}" data-hydro-click-hmac="8ed5f4db1143767854da0a7eb95d33ced95a6ecf0c8dbbab64e6ff07f278132f" data-ga-click="Repository, click star button, action:blob#show; text:Star">        <svg class="octicon octicon-star v-align-text-bottom" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74L14 6z"/></svg>
        Star
</button>        <a class="social-count js-social-count" href="/HaplyHaptics/hAPI_Fisica/stargazers"
           aria-label="1 user starred this repository">
          1
        </a>
</form>  </div>

  </li>

  <li>
          <details class="details-reset details-overlay details-overlay-dark d-inline-block float-left">
            <summary class="btn btn-sm btn-with-count" data-hydro-click="{&quot;event_type&quot;:&quot;repository.click&quot;,&quot;payload&quot;:{&quot;target&quot;:&quot;FORK_BUTTON&quot;,&quot;repository_id&quot;:90829517,&quot;client_id&quot;:&quot;1702687968.1523289919&quot;,&quot;originating_request_id&quot;:&quot;D593:2234:0328:01A8:5CAE388E&quot;,&quot;originating_url&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica/blob/master/README.md&quot;,&quot;referrer&quot;:&quot;https://github.com/HaplyHaptics/hAPI_Fisica&quot;,&quot;user_id&quot;:1916741}}" data-hydro-click-hmac="c735baafb0ae38ee72b75accb47d5264da7315748331a382dccc21a4b4bd6d38" data-ga-click="Repository, show fork modal, action:blob#show; text:Fork" title="Fork your own copy of HaplyHaptics/hAPI_Fisica to your account">              <svg class="octicon octicon-repo-forked v-align-text-bottom" viewBox="0 0 10 16" version="1.1" width="10" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
              Fork
</summary>            <details-dialog
              class="anim-fade-in fast Box Box--overlay d-flex flex-column"
              src="/HaplyHaptics/hAPI_Fisica/fork?fragment=1"
              preload>
              <div class="Box-header">
                <button class="Box-btn-octicon btn-octicon float-right" type="button" aria-label="Close dialog" data-close-dialog>
                  <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
                </button>
                <h3 class="Box-title">Fork hAPI_Fisica</h3>
              </div>
              <div class="overflow-auto text-center">
                <include-fragment>
                  <div class="octocat-spinner my-3" aria-label="Loading..."></div>
                  <p class="f5 text-gray">If this dialog fails to load, you can visit <a href="/HaplyHaptics/hAPI_Fisica/fork">the fork page</a> directly.</p>
                </include-fragment>
              </div>
            </details-dialog>
          </details>

    <a href="/HaplyHaptics/hAPI_Fisica/network/members" class="social-count"
       aria-label="0 users forked this repository">
      0
    </a>
  </li>
</ul>

      <h1 class="public ">
  <svg class="octicon octicon-repo" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9H3V8h1v1zm0-3H3v1h1V6zm0-2H3v1h1V4zm0-2H3v1h1V2zm8-1v12c0 .55-.45 1-1 1H6v2l-1.5-1.5L3 16v-2H1c-.55 0-1-.45-1-1V1c0-.55.45-1 1-1h10c.55 0 1 .45 1 1zm-1 10H1v2h2v-1h3v1h5v-2zm0-10H2v9h9V1z"/></svg>
  <span class="author" itemprop="author"><a class="url fn" rel="author" data-hovercard-type="organization" data-hovercard-url="/orgs/HaplyHaptics/hovercard" href="/HaplyHaptics">HaplyHaptics</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a data-pjax="#js-repo-pjax-container" href="/HaplyHaptics/hAPI_Fisica">hAPI_Fisica</a></strong>

</h1>

    </div>
    
<nav class="reponav js-repo-nav js-sidenav-container-pjax container"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
    aria-label="Repository"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a class="js-selected-navigation-item selected reponav-item" itemprop="url" data-hotkey="g c" aria-current="page" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches repo_packages /HaplyHaptics/hAPI_Fisica" href="/HaplyHaptics/hAPI_Fisica">
      <svg class="octicon octicon-code" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a itemprop="url" data-hotkey="g i" class="js-selected-navigation-item reponav-item" data-selected-links="repo_issues repo_labels repo_milestones /HaplyHaptics/hAPI_Fisica/issues" href="/HaplyHaptics/hAPI_Fisica/issues">
        <svg class="octicon octicon-issue-opened" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"/></svg>
        <span itemprop="name">Issues</span>
        <span class="Counter">0</span>
        <meta itemprop="position" content="2">
</a>    </span>

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a data-hotkey="g p" itemprop="url" class="js-selected-navigation-item reponav-item" data-selected-links="repo_pulls checks /HaplyHaptics/hAPI_Fisica/pulls" href="/HaplyHaptics/hAPI_Fisica/pulls">
      <svg class="octicon octicon-git-pull-request" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
      <span itemprop="name">Pull requests</span>
      <span class="Counter">0</span>
      <meta itemprop="position" content="3">
</a>  </span>



    <a data-hotkey="g b" class="js-selected-navigation-item reponav-item" data-selected-links="repo_projects new_repo_project repo_project /HaplyHaptics/hAPI_Fisica/projects" href="/HaplyHaptics/hAPI_Fisica/projects">
      <svg class="octicon octicon-project" viewBox="0 0 15 16" version="1.1" width="15" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      Projects
      <span class="Counter" >0</span>
</a>

    <a class="js-selected-navigation-item reponav-item" data-hotkey="g w" data-selected-links="repo_wiki /HaplyHaptics/hAPI_Fisica/wiki" href="/HaplyHaptics/hAPI_Fisica/wiki">
      <svg class="octicon octicon-book" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M3 5h4v1H3V5zm0 3h4V7H3v1zm0 2h4V9H3v1zm11-5h-4v1h4V5zm0 2h-4v1h4V7zm0 2h-4v1h4V9zm2-6v9c0 .55-.45 1-1 1H9.5l-1 1-1-1H2c-.55 0-1-.45-1-1V3c0-.55.45-1 1-1h5.5l1 1 1-1H15c.55 0 1 .45 1 1zm-8 .5L7.5 3H2v9h6V3.5zm7-.5H9.5l-.5.5V12h6V3z"/></svg>
      Wiki
</a>
    <a class="js-selected-navigation-item reponav-item" data-selected-links="repo_graphs repo_contributors dependency_graph pulse people alerts /HaplyHaptics/hAPI_Fisica/pulse" href="/HaplyHaptics/hAPI_Fisica/pulse">
      <svg class="octicon octicon-graph" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"/></svg>
      Insights
</a>
    <a class="js-selected-navigation-item reponav-item" data-selected-links="repo_settings repo_branch_settings hooks integration_installations repo_keys_settings issue_template_editor /HaplyHaptics/hAPI_Fisica/settings" href="/HaplyHaptics/hAPI_Fisica/settings">
      <svg class="octicon octicon-gear" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M14 8.77v-1.6l-1.94-.64-.45-1.09.88-1.84-1.13-1.13-1.81.91-1.09-.45-.69-1.92h-1.6l-.63 1.94-1.11.45-1.84-.88-1.13 1.13.91 1.81-.45 1.09L0 7.23v1.59l1.94.64.45 1.09-.88 1.84 1.13 1.13 1.81-.91 1.09.45.69 1.92h1.59l.63-1.94 1.11-.45 1.84.88 1.13-1.13-.92-1.81.47-1.09L14 8.75v.02zM7 11c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z"/></svg>
      Settings
</a>
</nav>


  </div>
<div class="container new-discussion-timeline experiment-repo-nav  ">
  <div class="repository-content ">

    
    



  
    <a class="d-none js-permalink-shortcut" data-hotkey="y" href="/HaplyHaptics/hAPI_Fisica/blob/7df19402215f8bf062b3251ed163d18432dc836a/README.md">Permalink</a>

    <!-- blob contrib key: blob_contributors:v21:df6899a6c2baed80f13357a0baefaa1d -->

    

    <div class="d-flex flex-shrink-0 flex-items-start mb-3">
      
<details class="details-reset details-overlay select-menu branch-select-menu ">
  <summary class="btn btn-sm select-menu-button css-truncate"
           data-hotkey="w"
           
           title="Switch branches or tags">
    <i>Branch:</i>
    <span class="css-truncate-target">master</span>
  </summary>

  <details-menu class="select-menu-modal position-absolute" style="z-index: 99;" src="/HaplyHaptics/hAPI_Fisica/ref-list/master/README.md?source_action=show&amp;source_controller=blob" preload>
    <include-fragment class="select-menu-loading-overlay anim-pulse">
      <svg height="32" class="octicon octicon-octoface" viewBox="0 0 16 16" version="1.1" width="32" aria-hidden="true"><path fill-rule="evenodd" d="M14.7 5.34c.13-.32.55-1.59-.13-3.31 0 0-1.05-.33-3.44 1.3-1-.28-2.07-.32-3.13-.32s-2.13.04-3.13.32c-2.39-1.64-3.44-1.3-3.44-1.3-.68 1.72-.26 2.99-.13 3.31C.49 6.21 0 7.33 0 8.69 0 13.84 3.33 15 7.98 15S16 13.84 16 8.69c0-1.36-.49-2.48-1.3-3.35zM8 14.02c-3.3 0-5.98-.15-5.98-3.35 0-.76.38-1.48 1.02-2.07 1.07-.98 2.9-.46 4.96-.46 2.07 0 3.88-.52 4.96.46.65.59 1.02 1.3 1.02 2.07 0 3.19-2.68 3.35-5.98 3.35zM5.49 9.01c-.66 0-1.2.8-1.2 1.78s.54 1.79 1.2 1.79c.66 0 1.2-.8 1.2-1.79s-.54-1.78-1.2-1.78zm5.02 0c-.66 0-1.2.79-1.2 1.78s.54 1.79 1.2 1.79c.66 0 1.2-.8 1.2-1.79s-.53-1.78-1.2-1.78z"/></svg>
    </include-fragment>
  </details-menu>
</details>

      <h2 id="blob-path" class="breadcrumb flex-auto flex-self-center min-width-0 text-normal mx-2">
        <span class="js-repo-root text-bold"><span class="js-path-segment"><a data-pjax="true" href="/HaplyHaptics/hAPI_Fisica"><span>hAPI_Fisica</span></a></span></span><span class="separator">/</span><strong class="final-path">README.md</strong>
      </h2>
      <div class="BtnGroup d-flex flex-justify-end flex-shrink-0">
        <a href="/HaplyHaptics/hAPI_Fisica/find/master"
              class="js-pjax-capture-input btn btn-sm BtnGroup-item"
              data-pjax
              data-hotkey="t">
          Find file
        </a>
        <clipboard-copy value="README.md" class="btn btn-sm BtnGroup-item">
          Copy path
        </clipboard-copy>
      </div>
    </div>



    <include-fragment src="/HaplyHaptics/hAPI_Fisica/contributors/master/README.md" class="Box Box--condensed commit-loader">
      <div class="Box-body bg-blue-light f6">
        Fetching contributors&hellip;
      </div>

      <div class="Box-body d-flex flex-items-center" >
          <img alt="" class="loader-loading mr-2" src="https://github.githubassets.com/images/spinners/octocat-spinner-32-EAF2F5.gif" width="16" height="16" />
        <span class="text-red h6 loader-error">Cannot retrieve contributors at this time</span>
      </div>
</include-fragment>




    <div class="Box mt-3 position-relative">
      
<div class="Box-header py-2 d-flex flex-justify-between flex-items-center">

  <div class="text-mono f6">
      1026 lines (584 sloc)
      <span class="file-info-divider"></span>
    46.5 KB
  </div>

  <div class="d-flex">

    <div class="BtnGroup">
      <a id="raw-url" class="btn btn-sm BtnGroup-item" href="/HaplyHaptics/hAPI_Fisica/raw/master/README.md">Raw</a>
        <a class="btn btn-sm js-update-url-with-hash BtnGroup-item" data-hotkey="b" href="/HaplyHaptics/hAPI_Fisica/blame/master/README.md">Blame</a>
      <a rel="nofollow" class="btn btn-sm BtnGroup-item" href="/HaplyHaptics/hAPI_Fisica/commits/master/README.md">History</a>
    </div>


    <div>
            <a class="btn-octicon tooltipped tooltipped-nw"
               href="x-github-client://openRepo/https://github.com/HaplyHaptics/hAPI_Fisica?branch=master&amp;filepath=README.md"
               aria-label="Open this file in GitHub Desktop"
               data-ga-click="Repository, open with desktop, type:mac">
                <svg class="octicon octicon-device-desktop" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M15 2H1c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h5.34c-.25.61-.86 1.39-2.34 2h8c-1.48-.61-2.09-1.39-2.34-2H15c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm0 9H1V3h14v8z"/></svg>
            </a>

            <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="inline-form js-update-url-with-hash" action="/HaplyHaptics/hAPI_Fisica/edit/master/README.md" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="56KLgl7k64L9xo3pNx5aOt+ROB6VZXD8JJJ8eXzC0wY5EbuGwxnnsoyRAsGxU+QgrvavXBDpW+M74y9IzlKdAA==" />
              <button class="btn-octicon tooltipped tooltipped-nw" type="submit"
                aria-label="Edit this file" data-hotkey="e" data-disable-with>
                <svg class="octicon octicon-pencil" viewBox="0 0 14 16" version="1.1" width="14" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg>
              </button>
</form>
          <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="inline-form" action="/HaplyHaptics/hAPI_Fisica/delete/master/README.md" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="YM+21bWfMF5gxsB/5mruPWiHOt0N1ihkS47mKJQzUCcaZu6e1STfY1f9cXnyfN7dvxvkG1GDJC8LEOXgjQYdYA==" />
            <button class="btn-octicon btn-octicon-danger tooltipped tooltipped-nw" type="submit"
              aria-label="Delete this file" data-disable-with>
              <svg class="octicon octicon-trashcan" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg>
            </button>
</form>    </div>
  </div>
</div>

      
  <div id="readme" class="Box-body readme blob instapaper_body js-code-block-container">
    <article class="markdown-body entry-content p-5" itemprop="text"><h1><a id="user-content-hapi-fisica" class="anchor" aria-hidden="true" href="#hapi-fisica"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>hAPI Fisica</h1>
<p>The following tutorial was developed by <a href="/HaplyHaptics/hAPI_Fisica/blob/master/www.ricardmarxer.com">Ricard Marxer</a>. It has been adapted by <a href="http://crgallacher.com" rel="nofollow">Colin Gallacher</a> to work with the <a href="/HaplyHaptics/hAPI_Fisica/blob/master/www.github.com/haphub/hAPI_Fisica">hAPI fisica mod</a> from the original <a href="/HaplyHaptics/hAPI_Fisica/blob/master/www.ricardmarxer.com/fisica">fisica</a>.</p>
<p>The hAPI Fisica library is a wrapper to enable haptic functionality in Ricard Marxer's Fisica library for Processing. The hAPI Fisica library wraps the JBox2D physics engine so that it can be easily used within the Processing environment. hAPI hAPI Fisica enables this library to be used with the Haply Development kit and Hapkit.</p>
<p>The detailed documentation can be found at: <a href="https://haplyhaptics.github.io/hAPI_Fisica/" rel="nofollow">https://haplyhaptics.github.io/hAPI_Fisica/</a></p>
<p>see also: <a href="https://haplyhaptics.github.io/hAPI/" rel="nofollow">https://haplyhaptics.github.io/hAPI/</a> for information on how the hAPI interfaces between Processing and the Haply and Hapkit open-sourced haptic devices</p>
<p>For any questions or concerns please email Colin Gallacher at <a href="mailto:crgallacher@gmail.com">crgallacher@gmail.com</a></p>
<h2><a id="user-content-hapi-fisica--jbox2d-physics-engine" class="anchor" aria-hidden="true" href="#hapi-fisica--jbox2d-physics-engine"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>hAPI Fisica / JBox2D physics engine</h2>
<h3><a id="user-content-from-processing" class="anchor" aria-hidden="true" href="#from-processing"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>From Processing</h3>
<p>This tutorial is about <a href="https://web.archive.org/web/20140802193416/http://www.ricardmarxer.com/fisica/" title="http://www.ricardmarxer.com/fisica/" rel="nofollow">fisica</a>, a wrapper around JBox2D physics engine originally devloped by Ricard Marxer to work in Processing. The fisica library has been modified and extended to enable usage with the <a href="http://www.haply.co" rel="nofollow">Haply Development Kit</a> and the <a href="http://hapkit.stanford.edu" rel="nofollow">Hapkit</a>. This library makes it much easier to create physical models by exposing an object oriented API. The tutorial is based on version 12 of fisica for Processing 2.</p>
<h2><a id="user-content-contents" class="anchor" aria-hidden="true" href="#contents"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Contents</h2>
<div id="user-content-globalwrapper">
<div id="user-content-column-content">
<div id="user-content-content"><a name="user-content-top" id="user-content-top"></a>
<table id="user-content-toc" summary="Contents">
<tbody>
<tr>
<td>
<p><span>[hide]</span></p>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>1</span> <span>Physics libraries for Processing</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>2</span> <span>Motivation</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>3</span> <span>Hello World</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>3.1</span> <span>Initialize</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>3.2</span> <span>Create the world</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>3.3</span> <span>Execute and draw the world</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>3.4</span> <span>The first body</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>3.5</span> <span>Add borders to the world</span></a></li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>4</span> <span>The world</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>4.1</span> <span>Properties and actions</span></a></li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>5</span> <span>The bodies</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>5.1</span> <span>FBox</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>5.2</span> <span>FCircle</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>5.3</span> <span>FPoly</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>5.4</span> <span>FLine</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>5.5</span> <span>FCompound</span></a></li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>6</span> <span>Common properties of bodies</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>6.1</span> <span>Dynamic properties</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>6.2</span> <span>Material properties</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>6.3</span> <span>Properties of style (drawing)</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>6.4</span> <span>Other properties - I</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>6.5</span> <span>Other properties - II</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>6.6</span> <span>Actions of the body</span></a></li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>7</span> <span>Joints</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>7.1</span> <span>FDistanceJoint - The spring</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>7.1.1</span> <span>Properties</span></a></li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>7.2</span> <span>FPrismaticJoint - The rotor</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>7.2.1</span> <span>Properties</span></a></li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>7.3</span> <span>FRevoluteJoint - The axis</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>7.3.1</span> <span>Properties</span></a></li>
</ul>
</li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>8</span> <span>Common properties of joints</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>8.1</span> <span>Dynamic properties</span></a></li>
</ul>
</li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>9</span> <span>Contacts</span></a>
<ul>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>9.1</span> <span>Contacts are events</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>9.2</span> <span>Not everything is valid with contacts</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>9.3</span> <span>Properties of contacts</span></a></li>
<li><a href="/HaplyHaptics/hAPI_Fisica/blob/master"><span>9.4</span> <span>A different form of access to contacts</span></a></li>
</ul>
</li>
</ul>
</td>
</tr>
</tbody>
</table>
<h1><a id="user-content-physics-libraries-for-processing" class="anchor" aria-hidden="true" href="#physics-libraries-for-processing"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Physics libraries for Processing</span></h1>
<p>There are <a href="https://web.archive.org/web/20140802193416/http://processing.org/reference/libraries/#simulation_math" title="http://processing.org/reference/libraries/#simulation_math" rel="nofollow">different physics libraries</a> for Processing:</p>
<ul>
<li><em>Traer Physics</em>: Physics simulator for particles</li>
<li><em>toxiclibs</em>: Module vertletphysics is a simple 3D physics simulator</li>
<li><em>PPhys2D</em>: Built on Phys2D (alternative to JBox2D not maintained any more)</li>
<li><em>PBox2D</em>: Collection of help functions for JBox2D</li>
<li><em>BoxWrap2d</em>: Library built on top of JBox2D</li>
<li><em>fisica</em>: Object oriented implementation of JBox2D</li>
</ul>
<p><a name="user-content-motivation" id="user-content-motivation"></a></p>
<h1><a id="user-content-motivation" class="anchor" aria-hidden="true" href="#motivation"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Motivation</span></h1>
<p>Make the creation of 2D physics simulations in Processing as easy as possible without hiding any functionality. Main Characteristics:</p>
<ul>
<li>Object orientation</li>
<li>Default values</li>
<li>Implementation of common user cases</li>
<li>Manage styles like Processing</li>
<li>Manage events like Processing</li>
</ul>
<p>Allow advanced use of JBox2D:</p>
<ul>
<li>Access to underlying objects to allow access to full JBox2D</li>
</ul>
<p><a name="user-content-hello_world" id="user-content-hello_world"></a></p>
<h1><a id="user-content-hello-world" class="anchor" aria-hidden="true" href="#hello-world"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Hello World</span></h1>
<p><a name="user-content-initialize" id="user-content-initialize"></a></p>
<h2><a id="user-content-initialize" class="anchor" aria-hidden="true" href="#initialize"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Initialize</span></h2>
<ul>
<li>Call <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/hAPI_fisica/reference/fisica/hAPI_hAPI_Fisica.html#init%28processing.core.PApplet%29" title="http://ricardmarxer.com/fisica/reference/fisica/hAPI_hAPI_Fisica.html#init(processing.core.PApplet)" rel="nofollow">hAPI_fisica.init()</a> in setup() with the sketch as argument</li>
</ul>
<div dir="ltr">
<div>
<pre>
[<span>void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span>setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span>(</span><span>)</span> <span>{</span>
  [<span>size</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/size_.html)<span>(</span><span>400</span><span>,</span> <span>400</span><span>)</span><span>;</span>

  hAPI_fisica<span>.</span><span>init</span><span>(</span>[<span>this</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/this.html)<span>)</span><span>;</span>
<span>}</span></pre>
</div>
</div>
<p><a name="user-content-create_the_world" id="user-content-create_the_world"></a></p>
<h2><a id="user-content-create-the-world" class="anchor" aria-hidden="true" href="#create-the-world"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Create the world</span></h2>
<ul>
<li>Declare a global variable <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#FWorld" title="http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#FWorld" rel="nofollow">FWorld</a></li>
<li>Define a variable in setup() after initializing fisica</li>
<li>By default the world has 3 times the size of the sketch</li>
<li>Bodies leaving the world are stopped being simulated</li>
</ul>
<div dir="ltr">
<div>
<pre>
FWorld world<span>;</span>

[<span>void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span>setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span>(</span><span>)</span> <span>{</span>
  [<span>size</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/size_.html)<span>(</span><span>400</span><span>,</span> <span>400</span><span>)</span><span>;</span>

  hAPI_Fisica<span>.</span><span>init</span><span>(</span>[<span>this</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/this.html)<span>)</span><span>;</span>
  world <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FWorld<span>(</span><span>)</span><span>;</span>
<span>}</span></pre>
</div>
</div>
<p><a name="user-content-execute_and_draw_the_world" id="user-content-execute_and_draw_the_world"></a></p>
<h2><a id="user-content-execute-and-draw-the-world" class="anchor" aria-hidden="true" href="#execute-and-draw-the-world"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Execute and draw the world</span></h2>
<ul>
<li>Drawing and simulation are separated in two functions</li>
<li>Call FWorld <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#step%28%29" title="http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#step()" rel="nofollow">step()</a> and <a href="/HaplyHaptics/hAPI_Fisica/blob/master">draw()</a> functions in draw()</li>
<li>By default step() grows 1/60 seconds per step</li>
<li>By default draw() draws to your sketch</li>
</ul>
<div dir="ltr">
<div>
<pre>[<span>void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span>draw</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/draw_.html)<span>(</span><span>)</span> <span>{</span>
  world<span>.</span><span>step</span><span>(</span><span>)</span><span>;</span>
  world<span>.</span>[<span>draw</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/draw_.html)<span>(</span><span>)</span><span>;</span>
<span>}</span></pre>
</div>
</div>
<ul>
<li>FWorld.draw() doesn't delete the background, you have to call background()</li>
<li>Also you can make a debug drawing calling <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#drawDebug%28%29" title="http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#drawDebug()" rel="nofollow">drawDebug()</a></li>
</ul>
<p><a name="user-content-the_first_body" id="user-content-the_first_body"></a></p>
<h2><a id="user-content-the-first-body" class="anchor" aria-hidden="true" href="#the-first-body"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>The first body</span></h2>
<ul>
<li>Declare and construct a variable of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBox.html" title="http://ricardmarxer.com/fisica/reference/fisica/FBox.html" rel="nofollow">FBox</a></li>
<li>Add the body to the world</li>
</ul>
<div dir="ltr">
<div>
<pre>[<span>void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span>setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span>(</span><span>)</span> <span>{</span>
  <span>// ...</span>
  FBox b <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>30</span><span>,</span> <span>50</span><span>)</span><span>;</span>
  b<span>.</span><span>setPosition</span><span>(</span>[<span>width</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/width.html)<span>/</span><span>2</span><span>,</span> [<span>height</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/height.html)<span>/</span><span>2</span><span>)</span><span>;</span>
  world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>b<span>)</span><span>;</span>
<span>}</span></pre>
</div>
</div>
<ul>
<li>By default 20 pixles == 1 meter. To change it call <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/hAPI_Fisica.html#setScale%28float%29" title="http://ricardmarxer.com/fisica/reference/fisica/hAPI_hAPI_Fisica.html#setScale(float)" rel="nofollow">hAPI_hAPI_Fisica.setScale()</a> after hAPI_hAPI_Fisica.init(this).</li>
<li>By default the world has gravity. To change it call <a href="/HaplyHaptics/hAPI_Fisica/blob/master">world.setGravity()</a></li>
<li>The body "falls" from the screen.</li>
</ul>
<p><a name="user-content-add_borders_to_the_world" id="user-content-add_borders_to_the_world"></a></p>
<h2><a id="user-content-add-borders-to-the-world" class="anchor" aria-hidden="true" href="#add-borders-to-the-world"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Add borders to the world</span></h2>
<ul>
<li>Call <a href="/HaplyHaptics/hAPI_Fisica/blob/master">world.setEdges()</a> at setup() creates 4 static bodies which limits the world to the borders of the sketch.</li>
<li>This bodies are accessible: world.left, world.right, world.bottom, world.top</li>
<li>You can delete the ones you don't need.</li>
<li>By default this bodies are black.</li>
</ul>
<div dir="ltr">
<div>
<pre>[<span>void</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/void.html) [<span>setup</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/setup_.html)<span>(</span><span>)</span> <span>{</span>
  <span>// ...</span>

  world<span>.</span><span>setEdges</span><span>(</span><span>)</span><span>;</span>
  world<span>.</span><span>remove</span><span>(</span>world<span>.</span><span>top</span><span>)</span><span>;</span>
<span>}</span></pre>
</div>
</div>
<ul>
<li>By default the bodies can be dragged with the mouse.</li>
</ul>
<p><a name="user-content-the_world" id="user-content-the_world"></a></p>
<h1><a id="user-content-the-world" class="anchor" aria-hidden="true" href="#the-world"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>The world</span></h1>
<p><a name="user-content-properties_and_actions" id="user-content-properties_and_actions"></a></p>
<h2><a id="user-content-properties-and-actions" class="anchor" aria-hidden="true" href="#properties-and-actions"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Properties and actions</span></h2>
<p><strong>Borders</strong>: You can change some of the border properties:</p>
<div dir="ltr">
<div>
<pre>   [world.setEdgesFriction(0)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#setEdgesFriction%28float%29 "http://ricardmarxer.com/fisica/reference/fisica/FWorld.html#setEdgesFriction(float)")
   [world.setEdgesRestitution(1)]()
</pre>
</div>
</div>
<p><strong>Gravity</strong>: The world has a gravity which affects all mobile bodies. It can be changed:</p>
<div dir="ltr">
<div>
<pre>   [world.setGravity(0, -100)]()
</pre>
</div>
</div>
<p><strong>Draggable</strong>: Bodies of the world can be dragged by mouse. This can be turned off:</p>
<pre>   [world.setGrabbable(false)]()
</pre>
<p><strong>Body at one position</strong>: You can determine a body (or all bodies) which are at one position of the world:</p>
<pre>   [world.getBody(10.0, 10.0)]()
   [world.getBodies(10.0, 10.0)]()
</pre>
<p><strong>Clear</strong>: All bodies and connections can be cleared:</p>
<pre>   [world.clear()]()
</pre>
</div>
</div>
<p><a name="user-content-the_bodies" id="user-content-the_bodies"></a></p>
<h1><a id="user-content-the-bodies" class="anchor" aria-hidden="true" href="#the-bodies"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>The bodies</span></h1>
<p><a name="user-content-fbox" id="user-content-fbox"></a></p>
<h2><a id="user-content-fbox" class="anchor" aria-hidden="true" href="#fbox"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FBox</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBox.html" title="http://ricardmarxer.com/fisica/reference/fisica/FBox.html" rel="nofollow">FBox</a> have shape of a rectangle</li>
<li>Constructor has 2 arguments: width, height</li>
</ul>
<div dir="ltr">
<div>
<pre>FBox b <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>30</span><span>,</span> <span>50</span><span>)</span><span>;</span>
b<span>.</span><span>setPosition</span><span>(</span><span>100</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>b<span>)</span><span>;</span></pre>
</div>
</div>
<p>Change the dimensions of the rectangle:</p>
<div dir="ltr">
<div>
<pre>b<span>.</span><span>setWidth</span><span>(</span><span>40</span><span>)</span><span>;</span>
b<span>.</span><span>setHeight</span><span>(</span><span>40</span><span>)</span><span>;</span></pre>
</div>
</div>
<p><a name="user-content-fcircle" id="user-content-fcircle"></a></p>
<h2><a id="user-content-fcircle" class="anchor" aria-hidden="true" href="#fcircle"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FCircle</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FCircle.html" title="http://ricardmarxer.com/fisica/reference/fisica/FCircle.html" rel="nofollow">FCircle</a> have shape of a circle</li>
<li>Constructor has 1 argument: diameter</li>
</ul>
<div dir="ltr">
<div>
<pre>FCircle c <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FCircle<span>(</span><span>30</span><span>)</span><span>;</span>
c<span>.</span><span>setPosition</span><span>(</span><span>200</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>c<span>)</span><span>;</span></pre>
</div>
</div>
<p>Change the dimensions of the circle:</p>
<div dir="ltr">
<div>
<pre>c<span>.</span><span>setSize</span><span>(</span><span>40</span><span>)</span><span>;</span></pre>
</div>
</div>
<p><a name="user-content-fpoly" id="user-content-fpoly"></a></p>
<h2><a id="user-content-fpoly" class="anchor" aria-hidden="true" href="#fpoly"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FPoly</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FPoly.html" title="http://ricardmarxer.com/fisica/reference/fisica/FPoly.html" rel="nofollow">FPoly</a> have shape of a polygon</li>
<li>Constructor without arguments</li>
</ul>
<div dir="ltr">
<div>
<pre>FPoly p <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FPoly<span>(</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span><span>-30</span><span>,</span> <span>-20</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span> <span>30</span><span>,</span> <span>-20</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span> <span>30</span><span>,</span> <span>0</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span> <span>10</span><span>,</span> <span>0</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span> <span>10</span><span>,</span> <span>40</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span><span>-10</span><span>,</span> <span>40</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span><span>-10</span><span>,</span> <span>0</span><span>)</span><span>;</span>
p<span>.</span>[<span>vertex</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/vertex_.html)<span>(</span><span>-30</span><span>,</span> <span>0</span><span>)</span><span>;</span>
p<span>.</span><span>setPosition</span><span>(</span><span>300</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>p<span>)</span><span>;</span></pre>
</div>
</div>
<p>setPosition(x, y) positions the point 0, 0 of the polygon at point x, y of the canvas</p>
<p><a name="user-content-fline" id="user-content-fline"></a></p>
<h2><a id="user-content-fline" class="anchor" aria-hidden="true" href="#fline"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FLine</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FLine.html" title="http://ricardmarxer.com/fisica/reference/fisica/FLine.html" rel="nofollow">FLine</a> have the shape of a line</li>
<li>Always are static bodies</li>
<li>Constructor has 4 arguments: initX, initY, finalX, finalY</li>
</ul>
<div dir="ltr">
<div>
<pre>FLine l <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FLine<span>(</span><span>-150</span><span>,</span> <span>0</span><span>,</span> <span>150</span><span>,</span> <span>0</span><span>)</span><span>;</span>
l<span>.</span><span>setPosition</span><span>(</span>[<span>width</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/width.html)<span>/</span><span>2</span><span>,</span> <span>250</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>l<span>)</span><span>;</span></pre>
</div>
</div>
<ul>
<li>setPosition(x, y) positions point 0, 0 of the line at point x, y of canvas</li>
<li>Bodies collide with lines only in one direction</li>
<li>Start and end points can be modified</li>
</ul>
<div dir="ltr">
<div>
<pre>l<span>.</span><span>setStart</span><span>(</span><span>150</span><span>,</span> <span>0</span><span>)</span><span>;</span>
l<span>.</span><span>setEnd</span><span>(</span>[<span>width</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/width.html)<span>-150</span><span>,</span> <span>0</span><span>)</span><span>;</span></pre>
</div>
</div>
<p><a name="user-content-fcompound" id="user-content-fcompound"></a></p>
<h2><a id="user-content-fcompound" class="anchor" aria-hidden="true" href="#fcompound"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FCompound</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FCompund.html" title="http://ricardmarxer.com/fisica/reference/fisica/FCompund.html" rel="nofollow">FCompound</a> are compounded out of other bodies</li>
<li>Constructor has no arguments</li>
</ul>
<div dir="ltr">
<div>
<pre>FBox m1 <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>6</span><span>,</span> <span>60</span><span>)</span><span>;</span>

FCircle m2 <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FCircle<span>(</span><span>20</span><span>)</span><span>;</span>
m2<span>.</span><span>setPosition</span><span>(</span><span>0</span><span>,</span> <span>-30</span><span>)</span><span>;</span>

FCompound m <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FCompound<span>(</span><span>)</span><span>;</span>
m<span>.</span><span>addBody</span><span>(</span>m1<span>)</span><span>;</span>
m<span>.</span><span>addBody</span><span>(</span>m2<span>)</span><span>;</span>
m<span>.</span><span>setPosition</span><span>(</span><span>200</span><span>,</span> <span>300</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>m<span>)</span><span>;</span></pre>
</div>
</div>
<p><a name="user-content-common_properties_of_bodies" id="user-content-common_properties_of_bodies"></a></p>
<h1><a id="user-content-common-properties-of-bodies" class="anchor" aria-hidden="true" href="#common-properties-of-bodies"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Common properties of bodies</span></h1>
<p><a name="user-content-dynamic_properties" id="user-content-dynamic_properties"></a></p>
<h2><a id="user-content-dynamic-properties" class="anchor" aria-hidden="true" href="#dynamic-properties"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Dynamic properties</span></h2>
<div dir="ltr">
<div>
<p><strong>Position</strong>: position in pixels</p>
<pre>   [body.setPosition(100, 200)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBody.html#setPosition%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FBody.html#setPosition(float,%20float)")
</pre>
<p><strong>Rotation</strong>: rotation in radians</p>
<pre>   [body.setRotation(PI/4)]()
</pre>
<p><strong>Velocity</strong>: velocity in pixels per second</p>
<pre>   [body.setVelocity(50, 0)]()
</pre>
<p><strong>Angular velocity</strong>: rotation velocity in radians per second</p>
<pre>   [body.setAngularVelocity(PI/16)]()
</pre>
</div>
</div>
<p><a name="user-content-material_properties" id="user-content-material_properties"></a></p>
<h2><a id="user-content-material-properties" class="anchor" aria-hidden="true" href="#material-properties"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Material properties</span></h2>
<p><strong>Density</strong>: mass density of the object in gram per pixel 2</p>
<div dir="ltr">
<div>
<pre>   [body.setDensity(0.3)]()
</pre>
<p><strong>Restitution</strong>: loss of velocity at collision (perpendicular force of a collision) [value from 0 to 1]</p>
<pre>   [body.setRestitution(0.3)]()
</pre>
<p><strong>Friction</strong>: loss of velocity at friction (tangential force of a collision) [value from 0 to 1]</p>
<pre>   [body.setFriction(0.3)]()
</pre>
<p><strong>Damping</strong>: loss of velocity at movement [value from 0 to 1]</p>
<pre>   [body.setDamping(0.3)]()
</pre>
<p><strong>Angular damping</strong>: loss of velocity at rotation [value from 0 to 1]</p>
<pre>   [body.setAngularDamping(0.3)]()
</pre>
</div>
</div>
<p><a name="user-content-properties_of_style_.28drawing.29" id="user-content-properties_of_style_.28drawing.29"></a></p>
<h2><a id="user-content-properties-of-style-drawing" class="anchor" aria-hidden="true" href="#properties-of-style-drawing"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Properties of style (drawing)</span></h2>
<div dir="ltr">
<div>
<p><strong>Fill color</strong>: fill color of bodies, same format then Processing</p>
<pre>   [body.setFill(100, 20, 130)]()
</pre>
<p><strong>Stroke color</strong>: stroke color of bodies, same format then Processing</p>
<pre>   [body.setStroke(100, 20, 130)]()
</pre>
<p><strong>Stroke weight</strong>: stroke weight of body, same format then Processing</p>
<pre>   [body.setFriction(0.3)]()
</pre>
<p><strong>Image</strong>: draw body with a image</p>
<pre>   PImage imagen = loadImage("canica.png");
   [body.attachImage(imagen)]()
</pre>
</div>
</div>
<p><a name="user-content-other_properties_-_i" id="user-content-other_properties_-_i"></a></p>
<h2><a id="user-content-other-properties---i" class="anchor" aria-hidden="true" href="#other-properties---i"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Other properties - I</span></h2>
<div dir="ltr">
<div>
<p><strong>Dynamics</strong>: bodies by default are dynamic, they can be set static:</p>
<pre>   [body.setStatic(true)]()
</pre>
<p><strong>Rotateable</strong>: bodies by default are rotateable, this can be turned off:</p>
<pre>   [body.setRotatable(false)]()
</pre>
<p><strong>Sleepable</strong>: when bodies don't have contacts during certain time the enter the state sleepable and are stopped being simulated</p>
<pre>   [body.setAllowSleeping(false)]()
</pre>
<p><strong>Grabbable</strong>: you can grab the body with the mouse</p>
<pre>   [body.setGrabbable(false)]()
</pre>
<p><strong>Drawable</strong>: by default all bodies of a world are drawn, this can be turned off:</p>
<pre>   [body.setDrawable(false)]()
</pre>
</div>
</div>
<p><a name="user-content-other_properties_-_ii" id="user-content-other_properties_-_ii"></a></p>
<h2><a id="user-content-other-properties---ii" class="anchor" aria-hidden="true" href="#other-properties---ii"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Other properties - II</span></h2>
<div dir="ltr">
<div>
<p><strong>Sensor</strong>: The body gets in contact and collides with other bodies. Collisions can be turned off while maintaining contact detection to know when a body enters a certain region:</p>
<pre>   [body.setSensor(true)]()
</pre>
<p><strong>Tags</strong>: giving tags to bodies makes it easier to detect contacts</p>
<pre>   [body.setName("hole")]()
</pre>
<p><strong>Groups</strong>: by default all bodies contact with all. You can define groups to detect certain contacts. Bodies belonging to a negative group don't contact with bodies of the same group.</p>
<pre>   [body.setGroupIndex(-1)]()
</pre>
<p><strong>Categories or filters</strong>: You can define categories and groups a body belongs to and which it can contact. But you need knowledge with binary masks:</p>
<pre>   [body.setCategoryBits(0x0002) // 0x0002  == 0000 0000 0000 0010]() 
</pre>
<pre>   [body.setFilterBits(0x0004) // 0x0004  == 0000 0000 0000 0100]()
</pre>
</div>
</div>
<p><a name="user-content-actions_of_the_body" id="user-content-actions_of_the_body"></a></p>
<h2><a id="user-content-actions-of-the-body" class="anchor" aria-hidden="true" href="#actions-of-the-body"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Actions of the body</span></h2>
<div dir="ltr">
<div>
<p><strong>Impulse</strong>: Apply a impulse (similar to a hit)</p>
<pre>   [body.addImpulse(100, 0)]()
</pre>
<pre>   [body.addImpulse(100, 0, 0, 40)]()
</pre>
<p><strong>Force</strong>: apply a force (similar to push, usually we apply it during some time)</p>
<pre>   [body.addForce(100, 0)]()
</pre>
<pre>   [body.addForce(100, 0, 0, 40)]()
</pre>
<p><strong>Angular force</strong>: add a angular force (like torque)</p>
<pre>   [body.addTorque(PI/6)]()
</pre>
<p><strong>Draw</strong>: draw the body. Specially interesting when a body hasn't been added to the world:</p>
<pre>   [body.draw()]()
</pre>
<p><strong>Technical draw</strong>: draw the state of the body. Specially interesting during development:</p>
<pre>   [body.drawDebug()]()
</pre>
</div>
</div>
<p><a name="user-content-joints" id="user-content-joints"></a></p>
<h1><a id="user-content-joints" class="anchor" aria-hidden="true" href="#joints"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Joints</span></h1>
<p><a name="user-content-fdistancejoint_-_the_spring" id="user-content-fdistancejoint_-_the_spring"></a></p>
<h2><a id="user-content-fdistancejoint---the-spring" class="anchor" aria-hidden="true" href="#fdistancejoint---the-spring"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FDistanceJoint - The spring</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html" title="http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html" rel="nofollow">FDistanceJoint</a> are spring joints</li>
<li>Constructor has 2 arguments: body1, body2</li>
</ul>
<div dir="ltr">
<div>
<pre>FBox b1 <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>70</span><span>,</span> <span>20</span><span>)</span><span>;</span>
b1<span>.</span><span>setPosition</span><span>(</span><span>100</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>b1<span>)</span><span>;</span>
FBox b2 <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>20</span><span>,</span> <span>50</span><span>)</span><span>;</span>
b2<span>.</span><span>setPosition</span><span>(</span><span>300</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>b2<span>)</span><span>;</span>
FDistanceJoint spring <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FDistanceJoint<span>(</span>b1<span>,</span> b2<span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>spring<span>)</span><span>;</span></pre>
</div>
</div>
<p><a name="user-content-properties" id="user-content-properties"></a></p>
<h3><a id="user-content-properties" class="anchor" aria-hidden="true" href="#properties"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Properties</span></h3>
<div dir="ltr">
<div>
<ul>
<li>By default the spring hooks into the center of the bodies. But you can hook it into any position relative to the center:</li>
</ul>
<pre>   [spring.setAnchor1(30, 0)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html#setAnchor1%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FDistanceJoint.html#setAnchor1(float,%20float)")
   [spring.setAnchor2(0, 40)]()
</pre>
<ul>
<li>By default the spring is rigid. But it can be elastic controlling frequency and amortization:</li>
</ul>
<pre>   [spring.setFrequency(0.5)]()
   [spring.setDamping(0.1)]()
</pre>
<ul>
<li>By default the balance between bodies is the distance between the bodies. But it can be arbitrary:</li>
</ul>
<pre>   [spring.setLength(60)]()
</pre>
</div>
</div>
<p><a name="user-content-fprismaticjoint_-_the_rotor" id="user-content-fprismaticjoint_-_the_rotor"></a></p>
<h2><a id="user-content-fprismaticjoint---the-rotor" class="anchor" aria-hidden="true" href="#fprismaticjoint---the-rotor"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FPrismaticJoint - The rotor</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html" title="http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html" rel="nofollow">FPrismaticJoint</a> are rotor joints</li>
<li>Constructor has 2 arguments: body1, body2</li>
<li>Typically you use it with one fixed and another mobile body</li>
</ul>
<div dir="ltr">
<div>
<pre>FBox b2 <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>20</span><span>,</span> <span>50</span><span>)</span><span>;</span>
b2<span>.</span><span>setPosition</span><span>(</span><span>300</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>b2<span>)</span><span>;</span>
FPrismaticJoint rotor <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FPrismaticJoint<span>(</span>world<span>.</span><span>bottom</span><span>,</span> b2<span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>rotor<span>)</span><span>;</span></pre>
</div>
</div>
<p><a name="user-content-properties_2" id="user-content-properties_2"></a></p>
<h3><a id="user-content-properties-1" class="anchor" aria-hidden="true" href="#properties-1"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Properties</span></h3>
<ul>
<li>By default the rotor has a vertical orientation. But the rotor can be oriented at any direction:</li>
</ul>
<div dir="ltr">
<div>
<pre>   [piston.setAxis(1, 0)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html#setAxis%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FPrismaticJoint.html#setAxis(float,%20float)")
</pre>
<ul>
<li>By default the movement on the rotor is not limited. But you can limit it:</li>
</ul>
<pre>   [piston.setEnableLimit(true)]()
   [piston.setLowerTranslation(-50)]()
   [piston.setUpperTranslation(150)]()
</pre>
</div>
</div>
<p><a name="user-content-frevolutejoint_-_the_axis" id="user-content-frevolutejoint_-_the_axis"></a></p>
<h2><a id="user-content-frevolutejoint---the-axis" class="anchor" aria-hidden="true" href="#frevolutejoint---the-axis"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>FRevoluteJoint - The axis</span></h2>
<ul>
<li>Variables of type <a href="https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html" title="http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html" rel="nofollow">FRevoluteJoint</a> are axis joints</li>
<li>Constructor has 2 arguments: body1, body2</li>
</ul>
<div dir="ltr">
<div>
<pre>FBox b1 <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>70</span><span>,</span> <span>20</span><span>)</span><span>;</span>
b1<span>.</span><span>setPosition</span><span>(</span><span>100</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>b1<span>)</span><span>;</span>
FBox b2 <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FBox<span>(</span><span>20</span><span>,</span> <span>50</span><span>)</span><span>;</span>
b2<span>.</span><span>setPosition</span><span>(</span><span>300</span><span>,</span> <span>100</span><span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>b2<span>)</span><span>;</span>
FRevoluteJoint axis <span>=</span> [<span>new</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/new.html) FRevoluteJoint<span>(</span>b1<span>,</span> b2<span>)</span><span>;</span>
world<span>.</span>[<span>add</span>](https://web.archive.org/web/20140802193416/http://processing.org/reference/add_.html)<span>(</span>axis<span>)</span><span>;</span></pre>
</div>
</div>
<p><a name="user-content-properties_3" id="user-content-properties_3"></a></p>
<h3><a id="user-content-properties-2" class="anchor" aria-hidden="true" href="#properties-2"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Properties</span></h3>
<div dir="ltr">
<div>
<ul>
<li>By default the rotation axis is in the middle between the two bodies. But you can position it on any absolute point of the canvas:</li>
</ul>
<pre>   [axis.setAnchor(width/2, height/2)](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html#setAnchor%28float,%20float%29 "http://ricardmarxer.com/fisica/reference/fisica/FRevoluteJoint.html#setAnchor(float,%20float)")
</pre>
<ul>
<li>By default movement around the axis is not limited. But you can limit it:</li>
</ul>
<pre>   [axis.setEnableLimit(true)]()
   [axis.setLowerAngle(-PI/4)]()
   [axis.setUpperAngle(PI/4)]()
</pre>
</div>
</div> 
<p><a name="user-content-common_properties_of_joints" id="user-content-common_properties_of_joints"></a></p>
<h1><a id="user-content-common-properties-of-joints" class="anchor" aria-hidden="true" href="#common-properties-of-joints"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Common properties of joints</span></h1>
<p><a name="user-content-dynamic_properties_2" id="user-content-dynamic_properties_2"></a></p>
<h2><a id="user-content-dynamic-properties-1" class="anchor" aria-hidden="true" href="#dynamic-properties-1"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Dynamic properties</span></h2>
<p><strong>Collision</strong>: Bodies united by joints collide between themselves. You can avoid it by:</p>
<div dir="ltr">
<div>
<pre>   [junta.setCollideConnected(false)]()
</pre>
<p>Reaction force**: Reaction force of translation which the joint executes on the second body.**</p>
<pre>   [junta.getReactionForceX()]()
   [junta.getReactionForceY()]()
</pre>
<p><strong>Angular reaction force</strong>: Angular reaction force (of torque) which executes the joint on the second body.</p>
<pre>   [junta.getReactionTorque()]()
</pre>
</div>
</div>
<p><a name="user-content-contacts" id="user-content-contacts"></a></p>
<h1><a id="user-content-contacts" class="anchor" aria-hidden="true" href="#contacts"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Contacts</span></h1>
<p><a name="user-content-contacts_are_events" id="user-content-contacts_are_events"></a></p>
<h2><a id="user-content-contacts-are-events" class="anchor" aria-hidden="true" href="#contacts-are-events"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Contacts are events</span></h2>
<ul>
<li>Works similar to mouse events in Processing</li>
<li>Contact methods:</li>
</ul>
<div dir="ltr">
<div>
<pre>   void contactStarted(FContact contact) { // code to execute }
</pre>
<pre>   void contactPersisted(FContact contact) { // code to execute }
</pre>
<pre>   void contactEnded(FContact contact) { // code to execute }
</pre>
<p><a name="user-content-not_everything_is_valid_with_contacts" id="user-content-not_everything_is_valid_with_contacts"></a></p>
</div>
</div>
<h2><a id="user-content-not-everything-is-valid-with-contacts" class="anchor" aria-hidden="true" href="#not-everything-is-valid-with-contacts"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Not everything is valid with contacts</span></h2>
<p>A lot of actions are not permitted during contacts in JBox2D (e.g. add/remove bodies from the world). But in fisica we solved it. If you find any action that is not valid, contact us!</p>
<p><a name="user-content-properties_of_contacts" id="user-content-properties_of_contacts"></a></p>
<h2><a id="user-content-properties-of-contacts" class="anchor" aria-hidden="true" href="#properties-of-contacts"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>Properties of contacts</span></h2>
<p><strong>The bodies</strong>: two bodies of the contact</p>
<div dir="ltr">
<div>
<pre>   [contact.getBody1()]()
   [contact.getBody2()]()
   [contact.contains("ball", "hole")  // you can ask for them by tag]()
</pre>
<pre>   [contact.contains(body)  // you can ask by variable]()
</pre>
<p><strong>Point of contact</strong>: point where the contact starts</p>
<pre>   [contact.getX()]()
   [contact.getY()]()
</pre>
<p><strong>Direction</strong>: direction of the contact (normal vector of the contact)</p>
<pre>   [contact.getNormalX()]()
   [contact.getNormalY()]()
</pre>
<p><strong>Velocity</strong>: velocity of the contact (relative velocity between bodies)</p>
<pre>   [contact.getVelocityX()]()
   [contact.getVelocityY()]()
</pre>
<p><strong>Separation</strong>: the simulation is not perfect, there can always exist a certain separation (o penetration) between bodies</p>
<pre>   [contact.getSeparation()]()
</pre>
<p><a name="user-content-a_different_form_of_access_to_contacts" id="user-content-a_different_form_of_access_to_contacts"></a></p>
</div>
</div> 
<h2><a id="user-content-a-different-form-of-access-to-contacts" class="anchor" aria-hidden="true" href="#a-different-form-of-access-to-contacts"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a><span>A different form of access to contacts</span></h2>
<ul>
<li>Contacts can be asked to the body</li>
</ul>
<div dir="ltr">
<div>
<pre>   [body.getContacts()]()
</pre>
<ul>
<li>Also can be asked for if the touch a certain body</li>
</ul>
<pre>   [body.isTouchingBody(anotherbody)]()
</pre>
<ul>
<li>Or just ask for the bodies which it touches</li>
</ul>
<pre>   [body.getTouching()](https://web.archive.org/web/20140802193416/http://ricardmarxer.com/fisica/reference/fisica/FBody.html#getTouching%28%29 "http://ricardmarxer.com/fisica/reference/fisica/FBody.html#getTouching()")
</pre>
</div>
</div>
</div>

&lt;script type="text/javascript"&gt;if (window.runOnloadHook) runOnloadHook();&lt;/script&gt;
</article>
  </div>

    </div>

  

  <details class="details-reset details-overlay details-overlay-dark">
    <summary data-hotkey="l" aria-label="Jump to line"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast linejump" aria-label="Jump to line">
      <!-- '"` --><!-- </textarea></xmp> --></option></form><form class="js-jump-to-line-form Box-body d-flex" action="" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
        <input class="form-control flex-auto mr-3 linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
        <button type="submit" class="btn" data-close-dialog>Go</button>
</form>    </details-dialog>
  </details>



  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>

    </main>
  </div>
  

  </div>

        
<div class="footer container-lg width-full px-3" role="contentinfo">
  <div class="position-relative d-flex flex-justify-between pt-6 pb-2 mt-6 f6 text-gray border-top border-gray-light ">
    <ul class="list-style-none d-flex flex-wrap ">
      <li class="mr-3">&copy; 2019 <span title="0.69440s from unicorn-7b64cb95db-lkg6w">GitHub</span>, Inc.</li>
        <li class="mr-3"><a data-ga-click="Footer, go to terms, text:terms" href="https://github.com/site/terms">Terms</a></li>
        <li class="mr-3"><a data-ga-click="Footer, go to privacy, text:privacy" href="https://github.com/site/privacy">Privacy</a></li>
        <li class="mr-3"><a data-ga-click="Footer, go to security, text:security" href="https://github.com/security">Security</a></li>
        <li class="mr-3"><a href="https://githubstatus.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a data-ga-click="Footer, go to help, text:help" href="https://help.github.com">Help</a></li>
    </ul>

    <a aria-label="Homepage" title="GitHub" class="footer-octicon mx-lg-4" href="https://github.com">
      <svg height="24" class="octicon octicon-mark-github" viewBox="0 0 16 16" version="1.1" width="24" aria-hidden="true"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
   <ul class="list-style-none d-flex flex-wrap ">
        <li class="mr-3"><a data-ga-click="Footer, go to contact, text:contact" href="https://github.com/contact">Contact GitHub</a></li>
        <li class="mr-3"><a href="https://github.com/pricing" data-ga-click="Footer, go to Pricing, text:Pricing">Pricing</a></li>
      <li class="mr-3"><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li class="mr-3"><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
        <li class="mr-3"><a href="https://github.blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a data-ga-click="Footer, go to about, text:about" href="https://github.com/about">About</a></li>

    </ul>
  </div>
  <div class="d-flex flex-justify-center pb-6">
    <span class="f6 text-gray-light"></span>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <button type="button" class="flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
    </button>
    You can’t perform that action at this time.
  </div>


    
    <script crossorigin="anonymous" integrity="sha512-eTqaaA351ov2p6KKbURlSYynIGTdgJ5DhFQAfe9VYTOnm88hqXgEqS5hkkcTXxMeglTQ9BlbSBdo8XI3MldqdQ==" type="application/javascript" src="https://github.githubassets.com/assets/frameworks-e00c2b83.js"></script>
    
    <script crossorigin="anonymous" async="async" integrity="sha512-hkDMzQytae3CoQTVG+ktsODMj3bjQvYE9xNyQjsu+qNyVfQOU8aHY8BJYq6iLd/FM51J63p9mKNHQFAuYjsirQ==" type="application/javascript" src="https://github.githubassets.com/assets/github-bootstrap-c78e11c8.js"></script>
    
    
    
  <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner" hidden
    >
    <svg class="octicon octicon-alert" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M8.893 1.5c-.183-.31-.52-.5-.887-.5s-.703.19-.886.5L.138 13.499a.98.98 0 0 0 0 1.001c.193.31.53.501.886.501h13.964c.367 0 .704-.19.877-.5a1.03 1.03 0 0 0 .01-1.002L8.893 1.5zm.133 11.497H6.987v-2.003h2.039v2.003zm0-3.004H6.987V5.987h2.039v4.006z"/></svg>
    <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <template id="site-details-dialog">
  <details class="details-reset details-overlay details-overlay-dark lh-default text-gray-dark" open>
    <summary aria-haspopup="dialog" aria-label="Close dialog"></summary>
    <details-dialog class="Box Box--overlay d-flex flex-column anim-fade-in fast">
      <button class="Box-btn-octicon m-0 btn-octicon position-absolute right-0 top-0" type="button" aria-label="Close dialog" data-close-dialog>
        <svg class="octicon octicon-x" viewBox="0 0 12 16" version="1.1" width="12" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48L7.48 8z"/></svg>
      </button>
      <div class="octocat-spinner my-6 js-details-dialog-spinner"></div>
    </details-dialog>
  </details>
</template>

  <div class="Popover js-hovercard-content position-absolute" style="display: none; outline: none;" tabindex="0">
  <div class="Popover-message Popover-message--bottom-left Popover-message--large Box box-shadow-large" style="width:360px;">
  </div>
</div>

  <div aria-live="polite" class="js-global-screen-reader-notice sr-only"></div>

  </body>
</html>

