"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[514,608],{27003:function(e,t,a){a.r(t),a.d(t,{default:function(){return C}});var n=a(67294),o=a(3905),r=a(46291),l=a(54814),c=a(10284),i=a(61914),s=a(24608),d=a(34096),m=a(86010),u=a(95999),p="backToTopButton_35hR",b="backToTopButtonShow_18ls",h=a(32822);function f(){var e=(0,n.useRef)(null);return{smoothScrollTop:function(){var t;e.current=(t=null,function e(){var a=document.documentElement.scrollTop;a>0&&(t=requestAnimationFrame(e),window.scrollTo(0,Math.floor(.85*a)))}(),function(){return t&&cancelAnimationFrame(t)})},cancelScrollToTop:function(){return null==e.current?void 0:e.current()}}}var v=function(){var e,t=(0,n.useState)(!1),a=t[0],o=t[1],r=(0,n.useRef)(!1),l=f(),c=l.smoothScrollTop,i=l.cancelScrollToTop;return(0,h.RF)((function(e,t){var a=e.scrollY,n=null==t?void 0:t.scrollY;if(n)if(r.current)r.current=!1;else{var l=a<n;if(l||i(),a<300)o(!1);else if(l){var c=document.documentElement.scrollHeight;a+window.innerHeight<c&&o(!0)}else o(!1)}})),(0,h.SL)((function(e){e.location.hash&&(r.current=!0,o(!1))})),n.createElement("button",{"aria-label":(0,u.I)({id:"theme.BackToTopButton.buttonAriaLabel",message:"Scroll back to top",description:"The ARIA label for the back to top button"}),className:(0,m.Z)("clean-btn",h.kM.common.backToTopButton,p,(e={},e[b]=a,e)),type:"button",onClick:function(){return c()}})},E=a(76775),k={docPage:"docPage_31aa",docMainContainer:"docMainContainer_3ufF",docSidebarContainer:"docSidebarContainer_3Kbt",docMainContainerEnhanced:"docMainContainerEnhanced_3NYZ",docSidebarContainerHidden:"docSidebarContainerHidden_3pA8",collapsedDocSidebar:"collapsedDocSidebar_2JMH",expandSidebarButtonIcon:"expandSidebarButtonIcon_1naQ",docItemWrapperEnhanced:"docItemWrapperEnhanced_2vyJ"},g=a(12859);function Z(e){var t,a,r,s=e.currentDocRoute,p=e.versionMetadata,b=e.children,f=p.pluginId,E=p.version,g=s.sidebar,Z=g?p.docsSidebars[g]:void 0,C=(0,n.useState)(!1),_=C[0],N=C[1],S=(0,n.useState)(!1),I=S[0],T=S[1],M=(0,n.useCallback)((function(){I&&T(!1),N((function(e){return!e}))}),[I]);return n.createElement(l.Z,{wrapperClassName:h.kM.wrapper.docsPages,pageClassName:h.kM.page.docsDocPage,searchMetadatas:{version:E,tag:(0,h.os)(f,E)}},n.createElement("div",{className:k.docPage},n.createElement(v,null),Z&&n.createElement("aside",{className:(0,m.Z)(k.docSidebarContainer,(t={},t[k.docSidebarContainerHidden]=_,t)),onTransitionEnd:function(e){e.currentTarget.classList.contains(k.docSidebarContainer)&&_&&T(!0)}},n.createElement(c.Z,{key:g,sidebar:Z,path:s.path,onCollapse:M,isHidden:I}),I&&n.createElement("div",{className:k.collapsedDocSidebar,title:(0,u.I)({id:"theme.docs.sidebar.expandButtonTitle",message:"Expand sidebar",description:"The ARIA label and title attribute for expand button of doc sidebar"}),"aria-label":(0,u.I)({id:"theme.docs.sidebar.expandButtonAriaLabel",message:"Expand sidebar",description:"The ARIA label and title attribute for expand button of doc sidebar"}),tabIndex:0,role:"button",onKeyDown:M,onClick:M},n.createElement(d.Z,{className:k.expandSidebarButtonIcon}))),n.createElement("main",{className:(0,m.Z)(k.docMainContainer,(a={},a[k.docMainContainerEnhanced]=_||!Z,a))},n.createElement("div",{className:(0,m.Z)("container padding-top--md padding-bottom--lg",k.docItemWrapper,(r={},r[k.docItemWrapperEnhanced]=_,r))},n.createElement(o.Zo,{components:i.Z},b)))))}var C=function(e){var t=e.route.routes,a=e.versionMetadata,o=e.location,l=t.find((function(e){return(0,E.LX)(o.pathname,e)}));return l?n.createElement(n.Fragment,null,n.createElement(g.Z,null,n.createElement("html",{className:a.className})),n.createElement(Z,{currentDocRoute:l,versionMetadata:a},(0,r.Z)(t,{versionMetadata:a}))):n.createElement(s.default,null)}},10284:function(e,t,a){a.d(t,{Z:function(){return D}});var n=a(67294),o=a(86010),r=a(32822),l=a(93783),c=a(55537),i=a(34096),s=a(95999),d=a(87462),m=a(63366),u=a(39960),p=a(13919),b=a(90541),h="menuLinkText_1J2g",f=["items"],v=["item"],E=["item","onItemClick","activePath","level"],k=["item","onItemClick","activePath","level"],g=function e(t,a){return"link"===t.type?(0,r.Mg)(t.href,a):"category"===t.type&&t.items.some((function(t){return e(t,a)}))},Z=(0,n.memo)((function(e){var t=e.items,a=(0,m.Z)(e,f);return n.createElement(n.Fragment,null,t.map((function(e,t){return n.createElement(C,(0,d.Z)({key:t,item:e},a))})))}));function C(e){var t=e.item,a=(0,m.Z)(e,v);return"category"===t.type?0===t.items.length?null:n.createElement(_,(0,d.Z)({item:t},a)):n.createElement(N,(0,d.Z)({item:t},a))}function _(e){var t,a=e.item,l=e.onItemClick,c=e.activePath,i=e.level,s=(0,m.Z)(e,E),u=a.items,p=a.label,b=a.collapsible,f=a.className,v=g(a,c),k=(0,r.uR)({initialState:function(){return!!b&&(!v&&a.collapsed)}}),C=k.collapsed,_=k.setCollapsed,N=k.toggleCollapsed;return function(e){var t=e.isActive,a=e.collapsed,o=e.setCollapsed,l=(0,r.D9)(t);(0,n.useEffect)((function(){t&&!l&&a&&o(!1)}),[t,l,a,o])}({isActive:v,collapsed:C,setCollapsed:_}),n.createElement("li",{className:(0,o.Z)(r.kM.docs.docSidebarItemCategory,r.kM.docs.docSidebarItemCategoryLevel(i),"menu__list-item",{"menu__list-item--collapsed":C},f)},n.createElement("a",(0,d.Z)({className:(0,o.Z)("menu__link",(t={"menu__link--sublist":b,"menu__link--active":b&&v},t[h]=!b,t)),onClick:b?function(e){e.preventDefault(),N()}:void 0,href:b?"#":void 0},s),p),n.createElement(r.zF,{lazy:!0,as:"ul",className:"menu__list",collapsed:C},n.createElement(Z,{items:u,tabIndex:C?-1:0,onItemClick:l,activePath:c,level:i+1})))}function N(e){var t=e.item,a=e.onItemClick,l=e.activePath,c=e.level,i=(0,m.Z)(e,k),s=t.href,h=t.label,f=t.className,v=g(t,l);return n.createElement("li",{className:(0,o.Z)(r.kM.docs.docSidebarItemLink,r.kM.docs.docSidebarItemLinkLevel(c),"menu__list-item",f),key:h},n.createElement(u.Z,(0,d.Z)({className:(0,o.Z)("menu__link",{"menu__link--active":v}),"aria-current":v?"page":void 0,to:s},(0,p.Z)(s)&&{onClick:a},i),(0,p.Z)(s)?h:n.createElement("span",null,h,n.createElement(b.Z,null))))}var S="sidebar_15mo",I="sidebarWithHideableNavbar_267A",T="sidebarHidden_2kNb",M="sidebarLogo_3h0W",A="menu_Bmed",y="menuWithAnnouncementBar_2WvA",w="collapseSidebarButton_1CGd",B="collapseSidebarButtonIcon_3E-R";function L(e){var t=e.onClick;return n.createElement("button",{type:"button",title:(0,s.I)({id:"theme.docs.sidebar.collapseButtonTitle",message:"Collapse sidebar",description:"The title attribute for collapse button of doc sidebar"}),"aria-label":(0,s.I)({id:"theme.docs.sidebar.collapseButtonAriaLabel",message:"Collapse sidebar",description:"The title attribute for collapse button of doc sidebar"}),className:(0,o.Z)("button button--secondary button--outline",w),onClick:t},n.createElement(i.Z,{className:B}))}function F(e){var t,a,l=e.path,i=e.sidebar,s=e.onCollapse,d=e.isHidden,m=function(){var e=(0,r.nT)().isActive,t=(0,n.useState)(e),a=t[0],o=t[1];return(0,r.RF)((function(t){var a=t.scrollY;e&&o(0===a)}),[e]),e&&a}(),u=(0,r.LU)(),p=u.navbar.hideOnScroll,b=u.hideableSidebar;return n.createElement("div",{className:(0,o.Z)(S,(t={},t[I]=p,t[T]=d,t))},p&&n.createElement(c.Z,{tabIndex:-1,className:M}),n.createElement("nav",{className:(0,o.Z)("menu thin-scrollbar",A,(a={},a[y]=m,a))},n.createElement("ul",{className:(0,o.Z)(r.kM.docs.docSidebarMenu,"menu__list")},n.createElement(Z,{items:i,activePath:l,level:1}))),b&&n.createElement(L,{onClick:s}))}var P=function(e){var t=e.toggleSidebar,a=e.sidebar,l=e.path;return n.createElement("ul",{className:(0,o.Z)(r.kM.docs.docSidebarMenu,"menu__list")},n.createElement(Z,{items:a,activePath:l,onItemClick:function(){return t()},level:1}))};function x(e){return n.createElement(r.Cv,{component:P,props:e})}var R=n.memo(F),H=n.memo(x);function D(e){var t=(0,l.Z)(),a="desktop"===t||"ssr"===t,o="mobile"===t;return n.createElement(n.Fragment,null,a&&n.createElement(R,e),o&&n.createElement(H,e))}},34096:function(e,t,a){var n=a(87462),o=a(67294);t.Z=function(e){return o.createElement("svg",(0,n.Z)({width:"20",height:"20","aria-hidden":"true"},e),o.createElement("g",{fill:"#7a7a7a"},o.createElement("path",{d:"M9.992 10.023c0 .2-.062.399-.172.547l-4.996 7.492a.982.982 0 01-.828.454H1c-.55 0-1-.453-1-1 0-.2.059-.403.168-.551l4.629-6.942L.168 3.078A.939.939 0 010 2.528c0-.548.45-.997 1-.997h2.996c.352 0 .649.18.828.45L9.82 9.472c.11.148.172.347.172.55zm0 0"}),o.createElement("path",{d:"M19.98 10.023c0 .2-.058.399-.168.547l-4.996 7.492a.987.987 0 01-.828.454h-3c-.547 0-.996-.453-.996-1 0-.2.059-.403.168-.551l4.625-6.942-4.625-6.945a.939.939 0 01-.168-.55 1 1 0 01.996-.997h3c.348 0 .649.18.828.45l4.996 7.492c.11.148.168.347.168.55zm0 0"})))}},24608:function(e,t,a){a.r(t);var n=a(67294),o=a(54814),r=a(95999);t.default=function(){return n.createElement(o.Z,{title:(0,r.I)({id:"theme.NotFound.title",message:"Page Not Found"})},n.createElement("main",{className:"container margin-vert--xl"},n.createElement("div",{className:"row"},n.createElement("div",{className:"col col--6 col--offset-3"},n.createElement("h1",{className:"hero__title"},n.createElement(r.Z,{id:"theme.NotFound.title",description:"The title of the 404 page"},"Page Not Found")),n.createElement("p",null,n.createElement(r.Z,{id:"theme.NotFound.p1",description:"The first paragraph of the 404 page"},"We could not find what you were looking for.")),n.createElement("p",null,n.createElement(r.Z,{id:"theme.NotFound.p2",description:"The 2nd paragraph of the 404 page"},"Please contact the owner of the site that linked you to the original URL and let them know their link is broken."))))))}}}]);