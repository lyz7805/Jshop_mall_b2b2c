(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-member-distribution-agreement"],{"35b0":function(t,e,n){"use strict";n.r(e);var r=n("4e3b"),a=n("3a82");for(var i in a)"default"!==i&&function(t){n.d(e,t,(function(){return a[t]}))}(i);n("6b23");var o,s=n("f0c5"),c=Object(s["a"])(a["default"],r["b"],r["c"],!1,null,"696bfd7b",null,!1,r["a"],o);e["default"]=c.exports},"3a82":function(t,e,n){"use strict";n.r(e);var r=n("77bf"),a=n.n(r);for(var i in r)"default"!==i&&function(t){n.d(e,t,(function(){return r[t]}))}(i);e["default"]=a.a},"4e3b":function(t,e,n){"use strict";var r;n.d(e,"b",(function(){return a})),n.d(e,"c",(function(){return i})),n.d(e,"a",(function(){return r}));var a=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("v-uni-view",{staticClass:"content"},[n("v-uni-view",{staticClass:"article"},[n("v-uni-view",{staticClass:"article-content"},[n("v-uni-rich-text",{attrs:{nodes:t.content}})],1)],1)],1)},i=[]},"5dd7":function(t,e,n){var r=n("24fb");e=r(!1),e.push([t.i,".content[data-v-696bfd7b]{\nheight:calc(100vh - %?90?%);\n\n\nbackground-color:#fff}.article[data-v-696bfd7b]{padding:%?20?%}.article-title[data-v-696bfd7b]{font-size:%?32?%;color:#333;margin-bottom:%?20?%;position:relative;height:%?100?%}.article-time[data-v-696bfd7b]{margin-left:%?20?%}.article-content[data-v-696bfd7b]{font-size:%?28?%!important;color:#666;line-height:1.6;margin-top:%?20?%}.article-content p img[data-v-696bfd7b]{width:100%!important}.shop-logo[data-v-696bfd7b]{width:%?60?%;height:%?60?%;-webkit-border-radius:50%;border-radius:50%;position:absolute;top:50%;-webkit-transform:translateY(-50%);transform:translateY(-50%)}.shop-name[data-v-696bfd7b]{line-height:%?100?%;margin-left:%?80?%}",""]),t.exports=e},"64ee":function(t,e,n){"use strict";n("c975"),n("13d5"),n("4d63"),n("ac1f"),n("25f0"),n("466d"),n("5319"),n("1276"),Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var r=/^<([-A-Za-z0-9_]+)((?:\s+[a-zA-Z_:][-a-zA-Z0-9_:.]*(?:\s*=\s*(?:(?:"[^"]*")|(?:'[^']*')|[^>\s]+))?)*)\s*(\/?)>/,a=/^<\/([-A-Za-z0-9_]+)[^>]*>/,i=/([a-zA-Z_:][-a-zA-Z0-9_:.]*)(?:\s*=\s*(?:(?:"((?:\\.|[^"])*)")|(?:'((?:\\.|[^'])*)')|([^>\s]+)))?/g,o=h("area,base,basefont,br,col,frame,hr,img,input,link,meta,param,embed,command,keygen,source,track,wbr"),s=h("a,address,article,applet,aside,audio,blockquote,button,canvas,center,dd,del,dir,div,dl,dt,fieldset,figcaption,figure,footer,form,frameset,h1,h2,h3,h4,h5,h6,header,hgroup,hr,iframe,isindex,li,map,menu,noframes,noscript,object,ol,output,p,pre,section,script,table,tbody,td,tfoot,th,thead,tr,ul,video"),c=h("abbr,acronym,applet,b,basefont,bdo,big,br,button,cite,code,del,dfn,em,font,i,iframe,img,input,ins,kbd,label,map,object,q,s,samp,script,select,small,span,strike,strong,sub,sup,textarea,tt,u,var"),d=h("colgroup,dd,dt,li,options,p,td,tfoot,th,thead,tr"),l=h("checked,compact,declare,defer,disabled,ismap,multiple,nohref,noresize,noshade,nowrap,readonly,selected"),u=h("script,style");function f(t,e){var n,f,h,b=[],p=t;b.last=function(){return this[this.length-1]};while(t){if(f=!0,b.last()&&u[b.last()])t=t.replace(new RegExp("([\\s\\S]*?)</"+b.last()+"[^>]*>"),(function(t,n){return n=n.replace(/<!--([\s\S]*?)-->|<!\[CDATA\[([\s\S]*?)]]>/g,"$1$2"),e.chars&&e.chars(n),""})),g("",b.last());else if(0==t.indexOf("\x3c!--")?(n=t.indexOf("--\x3e"),n>=0&&(e.comment&&e.comment(t.substring(4,n)),t=t.substring(n+3),f=!1)):0==t.indexOf("</")?(h=t.match(a),h&&(t=t.substring(h[0].length),h[0].replace(a,g),f=!1)):0==t.indexOf("<")&&(h=t.match(r),h&&(t=t.substring(h[0].length),h[0].replace(r,m),f=!1)),f){n=t.indexOf("<");var v=n<0?t:t.substring(0,n);t=n<0?"":t.substring(n),e.chars&&e.chars(v)}if(t==p)throw"Parse Error: "+t;p=t}function m(t,n,r,a){if(n=n.toLowerCase(),s[n])while(b.last()&&c[b.last()])g("",b.last());if(d[n]&&b.last()==n&&g("",n),a=o[n]||!!a,a||b.push(n),e.start){var u=[];r.replace(i,(function(t,e){var n=arguments[2]?arguments[2]:arguments[3]?arguments[3]:arguments[4]?arguments[4]:l[e]?e:"";u.push({name:e,value:n,escaped:n.replace(/(^|[^\\])"/g,'$1\\"')})})),e.start&&e.start(n,u,a)}}function g(t,n){if(n){for(r=b.length-1;r>=0;r--)if(b[r]==n)break}else var r=0;if(r>=0){for(var a=b.length-1;a>=r;a--)e.end&&e.end(b[a]);b.length=r}}g()}function h(t){for(var e={},n=t.split(","),r=0;r<n.length;r++)e[n[r]]=!0;return e}function b(t){return t.replace(/<\?xml.*\?>\n/,"").replace(/<!doctype.*>\n/,"").replace(/<!DOCTYPE.*>\n/,"")}function p(t){return t.reduce((function(t,e){var n=e.value,r=e.name;return t[r]?t[r]=t[r]+" "+n:t[r]=n,t}),{})}function v(t){t=b(t);var e=[],n={node:"root",children:[]};return f(t,{start:function(t,r,a){var i={name:t};if(0!==r.length&&(i.attrs=p(r)),a){var o=e[0]||n;o.children||(o.children=[]),o.children.push(i)}else e.unshift(i)},end:function(t){var r=e.shift();if(r.name!==t&&console.error("invalid state: mismatch end tag"),0===e.length)n.children.push(r);else{var a=e[0];a.children||(a.children=[]),a.children.push(r)}},chars:function(t){var r={type:"text",text:t};if(0===e.length)n.children.push(r);else{var a=e[0];a.children||(a.children=[]),a.children.push(r)}},comment:function(t){var n={node:"comment",text:t},r=e[0];r.children||(r.children=[]),r.children.push(n)}}),n.children}var m=v;e.default=m},"6b23":function(t,e,n){"use strict";var r=n("d6bc"),a=n.n(r);a.a},"77bf":function(t,e,n){"use strict";var r=n("4ea4");Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;r(n("64ee"));var a={data:function(){return{content:this.$store.state.config.distribution_agreement}},onLoad:function(t){},computed:{},methods:{}};e.default=a},d6bc:function(t,e,n){var r=n("5dd7");"string"===typeof r&&(r=[[t.i,r,""]]),r.locals&&(t.exports=r.locals);var a=n("4f06").default;a("fc903a36",r,!0,{sourceMap:!1,shadowMode:!1})}}]);