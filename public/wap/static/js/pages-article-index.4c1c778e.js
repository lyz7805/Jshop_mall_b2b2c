(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["pages-article-index"],{"0daf":function(t,i,e){"use strict";e.r(i);var a=e("6192"),n=e("6a9a");for(var o in n)"default"!==o&&function(t){e.d(i,t,(function(){return n[t]}))}(o);e("83ed");var s,r=e("f0c5"),c=Object(r["a"])(n["default"],a["b"],a["c"],!1,null,"e1648ef0",null,!1,a["a"],s);i["default"]=c.exports},"21d1":function(t,i,e){"use strict";var a=e("4ea4");Object.defineProperty(i,"__esModule",{value:!0}),i.default=void 0;var n=a(e("076f")),o={components:{jshopContent:n.default},data:function(){return{idType:1,id:0,info:{},shareUrl:"/pages/share/jump"}},onLoad:function(t){this.idType=t.id_type,this.id=t.id,this.idType||this.id?1==this.idType?this.articleDetail():2==this.idType?(uni.setNavigationBarTitle({title:"公告详情"}),this.noticeDetail()):3==this.idType&&(uni.setNavigationBarTitle({title:"图文消息"}),this.messageDetail()):this.$common.errorToShow("请求出错",(function(t){uni.switchTab({url:"/pages/index/index"})}))},computed:{shopName:function(){return this.$store.state.config.shop_name},shopLogo:function(){return this.$store.state.config.shop_logo}},methods:{articleDetail:function(){var t=this,i={article_id:this.id};this.$api.articleInfo(i,(function(i){i.status?(t.info=i.data,uni.setNavigationBarTitle({title:t.info.title})):t.$common.errorToShow(i.msg,(function(t){uni.navigateBack({delta:1})}))}))},noticeDetail:function(){var t=this,i={id:this.id};this.$api.noticeInfo(i,(function(i){i.status?(t.info=i.data,uni.setNavigationBarTitle({title:t.info.title})):t.$common.errorToShow(i.msg)}))},messageDetail:function(){var t=this,i={id:this.id};this.$api.messageDetail(i,(function(i){i.status?(t.info=i.data,uni.setNavigationBarTitle({title:t.info.title})):t.$common.errorToShow(i.msg)}))},getShareUrl:function(){var t=this,i={client:2,url:"/pages/share/jump",type:1,page:5,params:{article_id:this.id,article_type:this.idType}},e=this.$db.get("userToken");e&&""!=e&&(i["token"]=e),this.$api.share(i,(function(i){t.shareUrl=i.data}))}},watch:{id:{handler:function(){this.getShareUrl()},deep:!0}},onShareAppMessage:function(){return{title:this.info.title,path:this.shareUrl}}};i.default=o},6192:function(t,i,e){"use strict";var a;e.d(i,"b",(function(){return n})),e.d(i,"c",(function(){return o})),e.d(i,"a",(function(){return a}));var n=function(){var t=this,i=t.$createElement,e=t._self._c||i;return e("v-uni-view",{staticClass:"content"},[e("v-uni-view",{staticClass:"article"},[t.shopLogo&&t.shopName?e("v-uni-view",{staticClass:"article-title"},[e("img",{staticClass:"shop-logo",attrs:{src:t.shopLogo,alt:""}}),e("v-uni-text",{staticClass:"shop-name"},[t._v(t._s(t.shopName))]),e("v-uni-text",{staticClass:"fsz24 color-9 article-time"},[t._v(t._s(t.info.ctime))]),2!=t.idType?e("v-uni-image",{staticStyle:{width:"30rpx",height:"30rpx","vertical-align":"middle","margin-left":"20rpx"},attrs:{src:"/static/image/yuedu.png",mode:"scaleToFill"}}):t._e(),2!=t.idType?e("v-uni-text",{staticClass:"color-9 article-time",staticStyle:{"font-size":"24rpx"}},[t._v(t._s(t.info.pv))]):t._e()],1):t._e(),e("v-uni-view",{staticClass:"article-content"},[t.info.content?e("jshopContent",{attrs:{content:t.info.content}}):t._e()],1)],1)],1)},o=[]},"6a9a":function(t,i,e){"use strict";e.r(i);var a=e("21d1"),n=e.n(a);for(var o in a)"default"!==o&&function(t){e.d(i,t,(function(){return a[t]}))}(o);i["default"]=n.a},"83ed":function(t,i,e){"use strict";var a=e("feea"),n=e.n(a);n.a},a293:function(t,i,e){var a=e("24fb");i=a(!1),i.push([t.i,".content[data-v-e1648ef0]{\r\n\r\n\r\nbackground-color:#fff}.article[data-v-e1648ef0]{padding:%?20?%}.article-title[data-v-e1648ef0]{font-size:%?32?%;color:#333;margin-bottom:%?20?%;position:relative;height:%?100?%}.article-time[data-v-e1648ef0]{margin-left:%?20?%}.article-content[data-v-e1648ef0]{font-size:%?28?%!important;color:#666;line-height:1.6;margin-top:%?20?%}.article-content p img[data-v-e1648ef0]{width:100%!important}.shop-logo[data-v-e1648ef0]{width:%?60?%;height:%?60?%;-webkit-border-radius:50%;border-radius:50%;position:absolute;top:50%;-webkit-transform:translateY(-50%);transform:translateY(-50%)}.shop-name[data-v-e1648ef0]{line-height:%?100?%;margin-left:%?80?%}",""]),t.exports=i},feea:function(t,i,e){var a=e("a293");"string"===typeof a&&(a=[[t.i,a,""]]),a.locals&&(t.exports=a.locals);var n=e("4f06").default;n("74f4d289",a,!0,{sourceMap:!1,shadowMode:!1})}}]);