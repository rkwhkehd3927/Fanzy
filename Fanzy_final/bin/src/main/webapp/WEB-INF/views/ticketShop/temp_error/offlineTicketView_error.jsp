<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html class="notranslate" lang="en" style="--vh: 9.01px;" translate="no">
 <head>
  <style id="swiper-element-styles">
   @font-face{font-family:swiper-icons;src:url('data:application/font-woff;charset=utf-8;base64, d09GRgABAAAAAAZgABAAAAAADAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABGRlRNAAAGRAAAABoAAAAci6qHkUdERUYAAAWgAAAAIwAAACQAYABXR1BPUwAABhQAAAAuAAAANuAY7+xHU1VCAAAFxAAAAFAAAABm2fPczU9TLzIAAAHcAAAASgAAAGBP9V5RY21hcAAAAkQAAACIAAABYt6F0cBjdnQgAAACzAAAAAQAAAAEABEBRGdhc3AAAAWYAAAACAAAAAj//wADZ2x5ZgAAAywAAADMAAAD2MHtryVoZWFkAAABbAAAADAAAAA2E2+eoWhoZWEAAAGcAAAAHwAAACQC9gDzaG10eAAAAigAAAAZAAAArgJkABFsb2NhAAAC0AAAAFoAAABaFQAUGG1heHAAAAG8AAAAHwAAACAAcABAbmFtZQAAA/gAAAE5AAACXvFdBwlwb3N0AAAFNAAAAGIAAACE5s74hXjaY2BkYGAAYpf5Hu/j+W2+MnAzMYDAzaX6QjD6/4//Bxj5GA8AuRwMYGkAPywL13jaY2BkYGA88P8Agx4j+/8fQDYfA1AEBWgDAIB2BOoAeNpjYGRgYNBh4GdgYgABEMnIABJzYNADCQAACWgAsQB42mNgYfzCOIGBlYGB0YcxjYGBwR1Kf2WQZGhhYGBiYGVmgAFGBiQQkOaawtDAoMBQxXjg/wEGPcYDDA4wNUA2CCgwsAAAO4EL6gAAeNpj2M0gyAACqxgGNWBkZ2D4/wMA+xkDdgAAAHjaY2BgYGaAYBkGRgYQiAHyGMF8FgYHIM3DwMHABGQrMOgyWDLEM1T9/w8UBfEMgLzE////P/5//f/V/xv+r4eaAAeMbAxwIUYmIMHEgKYAYjUcsDAwsLKxc3BycfPw8jEQA/gZBASFhEVExcQlJKWkZWTl5BUUlZRVVNXUNTQZBgMAAMR+E+gAEQFEAAAAKgAqACoANAA+AEgAUgBcAGYAcAB6AIQAjgCYAKIArAC2AMAAygDUAN4A6ADyAPwBBgEQARoBJAEuATgBQgFMAVYBYAFqAXQBfgGIAZIBnAGmAbIBzgHsAAB42u2NMQ6CUAyGW568x9AneYYgm4MJbhKFaExIOAVX8ApewSt4Bic4AfeAid3VOBixDxfPYEza5O+Xfi04YADggiUIULCuEJK8VhO4bSvpdnktHI5QCYtdi2sl8ZnXaHlqUrNKzdKcT8cjlq+rwZSvIVczNiezsfnP/uznmfPFBNODM2K7MTQ45YEAZqGP81AmGGcF3iPqOop0r1SPTaTbVkfUe4HXj97wYE+yNwWYxwWu4v1ugWHgo3S1XdZEVqWM7ET0cfnLGxWfkgR42o2PvWrDMBSFj/IHLaF0zKjRgdiVMwScNRAoWUoH78Y2icB/yIY09An6AH2Bdu/UB+yxopYshQiEvnvu0dURgDt8QeC8PDw7Fpji3fEA4z/PEJ6YOB5hKh4dj3EvXhxPqH/SKUY3rJ7srZ4FZnh1PMAtPhwP6fl2PMJMPDgeQ4rY8YT6Gzao0eAEA409DuggmTnFnOcSCiEiLMgxCiTI6Cq5DZUd3Qmp10vO0LaLTd2cjN4fOumlc7lUYbSQcZFkutRG7g6JKZKy0RmdLY680CDnEJ+UMkpFFe1RN7nxdVpXrC4aTtnaurOnYercZg2YVmLN/d/gczfEimrE/fs/bOuq29Zmn8tloORaXgZgGa78yO9/cnXm2BpaGvq25Dv9S4E9+5SIc9PqupJKhYFSSl47+Qcr1mYNAAAAeNptw0cKwkAAAMDZJA8Q7OUJvkLsPfZ6zFVERPy8qHh2YER+3i/BP83vIBLLySsoKimrqKqpa2hp6+jq6RsYGhmbmJqZSy0sraxtbO3sHRydnEMU4uR6yx7JJXveP7WrDycAAAAAAAH//wACeNpjYGRgYOABYhkgZgJCZgZNBkYGLQZtIJsFLMYAAAw3ALgAeNolizEKgDAQBCchRbC2sFER0YD6qVQiBCv/H9ezGI6Z5XBAw8CBK/m5iQQVauVbXLnOrMZv2oLdKFa8Pjuru2hJzGabmOSLzNMzvutpB3N42mNgZGBg4GKQYzBhYMxJLMlj4GBgAYow/P/PAJJhLM6sSoWKfWCAAwDAjgbRAAB42mNgYGBkAIIbCZo5IPrmUn0hGA0AO8EFTQAA');font-weight:400;font-style:normal}
  </style>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, viewport-fit=cover" name="viewport"/>
  <link href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" rel="stylesheet"/>
<!--   <script async="" src="https://www.googletagmanager.com/gtag/destination?id=AW-16796759376&amp;l=dataLayer&amp;cx=c&amp;gtm=45be52o0v893030600za200zb9175504194" type="text/javascript"> -->
<!--   </script> -->
<!--   <script async="" src="//cdn.mxpnl.com/libs/mixpanel-2-latest.min.js" type="text/javascript"> -->
<!--   </script> -->
<!--   <script async="" src="https://cdn.mxpnl.com/libs/mixpanel-js-wrapper.js" type="text/javascript"> -->
<!--   </script> -->
<!--   <script async="" src="https://connect.facebook.net/signals/config/2375901832584041?v=2.9.184&amp;r=stable&amp;domain=www.bigc.im&amp;hme=93c44828b638838a88daf3a14a90ff297f7fc4ade758f21de5500c9f17542765&amp;ex_m=70%2C122%2C107%2C111%2C61%2C4%2C100%2C69%2C16%2C97%2C89%2C51%2C54%2C173%2C176%2C188%2C184%2C185%2C187%2C29%2C101%2C53%2C77%2C186%2C168%2C171%2C181%2C182%2C189%2C132%2C41%2C194%2C191%2C192%2C34%2C144%2C15%2C50%2C198%2C197%2C134%2C18%2C40%2C1%2C43%2C65%2C66%2C67%2C71%2C93%2C17%2C14%2C96%2C92%2C91%2C108%2C52%2C110%2C39%2C109%2C30%2C94%2C26%2C169%2C172%2C141%2C86%2C56%2C84%2C33%2C73%2C0%2C95%2C32%2C28%2C82%2C83%2C88%2C47%2C46%2C87%2C37%2C11%2C12%2C13%2C6%2C7%2C25%2C22%2C23%2C57%2C62%2C64%2C75%2C102%2C27%2C76%2C9%2C8%2C80%2C48%2C21%2C104%2C103%2C105%2C98%2C10%2C20%2C3%2C38%2C74%2C19%2C5%2C90%2C81%2C44%2C35%2C85%2C2%2C36%2C63%2C42%2C106%2C45%2C79%2C68%2C112%2C60%2C59%2C31%2C99%2C58%2C55%2C49%2C78%2C72%2C24%2C113"> -->
<!--   </script> -->
<!--   <script async="" src="https://connect.facebook.net/en_US/fbevents.js"> -->
<!--   </script> -->
<!--   <script async="" src="https://www.googletagmanager.com/gtag/js?id=AW-315497884&amp;l=dataLayer&amp;cx=c&amp;gtm=45He52o0v9175504194za200" type="text/javascript"> -->
<!--   </script> -->
<!--   <script async="" src="https://www.googletagmanager.com/gtag/js?id=G-RV674RBXVV&amp;l=dataLayer&amp;cx=c&amp;gtm=45He52o0v9175504194za200" type="text/javascript"> -->
<!--   </script> -->
<!--   <script type="application/ld+json"> -->
<!--   </script> -->
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <title>
   유우리 (YUURI) | [TICKET] YUURI ARENA LIVE 2025 at SEOUL
  </title>
  <meta content="Dive into K-pop &amp; culture live and events |ビック, 公演とイベント 최애 아티스트와 더 가까이 연결되는 순간. 빅크" name="description"/>
  <meta content="빅크, 케이팝, K팝, 케이컬쳐, K컬쳐, 라이브, 콘서트, 공연, 티켓팅, 투표, 동영상, 예능, 팬플레이, 뮤지션, 아티스트, 케이팝 앨범, 굿즈, MD, 월드투어, 투어 굿즈, ビック、K-POP、K-カルチャー、ライブ、コンサート、公演、チケッティング、投票,動画,芸能,ファンプレイ,ミュージシャン,アーティスト,K-POPアルバム,グッズ,MD，ワールドツアー, Bigc, K-pop, K-culture, K-culture, live, concert, performance, ticketing, voting, video, entertainment, fanplay, musician, artist, K-pop album, goods, MD, world tour, tourmerch" name="keyword"/>
  <link href="https://www.bigc.im/YUURI/clubs/W8K5332Z65" rel="canonical"/>
  <meta content="website" property="og:type"/>
  <meta content="유우리 (YUURI) | [TICKET] YUURI ARENA LIVE 2025 at SEOUL" property="og:title"/>
  <meta content="Dive into K-pop &amp; culture live and events |ビック, 公演とイベント 최애 아티스트와 더 가까이 연결되는 순간. 빅크" property="og:description"/>
  <meta content="https://cdn.bigc.im/uploads/attachments/2025/02/11/bF1axHZdsSuG5K143n2LtP9o8jEjvWc4HY5vLnH4.png" property="og:image"/>
  <meta content="https://www.bigc.im/YUURI/clubs/W8K5332Z65" property="og:url"/>
  <meta content="summary" name="twitter:card"/>
  <meta content="유우리 (YUURI) | [TICKET] YUURI ARENA LIVE 2025 at SEOUL" property="twitter:title"/>
  <meta content="Dive into K-pop &amp; culture live and events |ビック, 公演とイベント 최애 아티스트와 더 가까이 연결되는 순간. 빅크" property="twitter:description"/>
  <meta content="https://cdn.bigc.im/uploads/attachments/2025/02/11/bF1axHZdsSuG5K143n2LtP9o8jEjvWc4HY5vLnH4.png" property="twitter:image"/>
  <meta charset="utf-8"/>
  <meta content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0, viewport-fit=cover" name="viewport"/>
  <meta content="17" name="next-head-count"/>
  <link as="font" crossorigin="anonymous" data-next-font="size-adjust" href="https://www.bigc.im/_next/static/media/7108afb8b1381ad1-s.p.woff2" rel="preload" type="font/woff2"/>
  <link as="font" crossorigin="anonymous" data-next-font="size-adjust" href="https://www.bigc.im/_next/static/media/4c285fdca692ea22-s.p.woff2" rel="preload" type="font/woff2"/>
  <link as="font" crossorigin="anonymous" data-next-font="size-adjust" href="https://www.bigc.im/_next/static/media/eafabf029ad39a43-s.p.woff2" rel="preload" type="font/woff2"/>
  <link as="font" crossorigin="anonymous" data-next-font="size-adjust" href="https://www.bigc.im/_next/static/media/8888a3826f4a3af4-s.p.woff2" rel="preload" type="font/woff2"/>
  <link as="font" crossorigin="anonymous" data-next-font="size-adjust" href="https://www.bigc.im/_next/static/media/b957ea75a84b6ea7-s.p.woff2" rel="preload" type="font/woff2"/>
  <link as="font" crossorigin="anonymous" data-next-font="size-adjust" href="https://www.bigc.im/_next/static/media/6245472ced48d3be-s.p.woff2" rel="preload" type="font/woff2"/>
  <link as="style" href="https://www.bigc.im/_next/static/css/19805e74dd034cb0.css" rel="preload"/>
  <link data-n-g="" href="https://www.bigc.im/_next/static/css/19805e74dd034cb0.css" rel="stylesheet"/>
  <noscript data-n-css="">
  </noscript>
  <script defer="" nomodule="" src="https://www.bigc.im/_next/static/chunks/polyfills-78c92fac7aa8fdd8.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/webpack-460af51ef329634d.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/framework-a2363dd3c3dbe572.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/main-1603b0cdefd5f8d9.js">
  </script>  
  <script defer="" src="https://www.bigc.im/_next/static/chunks/pages/_app-6e5f9866b2473dde.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/7230-b608fe7fe9fb82cc.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/2854-228a76543d964158.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/4115-037b937b4cc0ce4a.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/9815-8d981aca441eb49a.js">
  </script>
  <script defer="" src="https://www.bigc.im/_next/static/chunks/2754-5bd12a1fe51cb5b5.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/3810-3d98159824bb6fd3.js">
  </script>
  <script defer="" src="https://www.bigc.im/_next/static/chunks/351-4f5c102861c2e0f2.js">
  </script>
  <script defer="" src="https://www.bigc.im/_next/static/chunks/597-81fea89772a34300.js">
  </script>
  <script defer="" src="https://www.bigc.im/_next/static/chunks/9267-64f73a23f083defb.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/1099-bf5e64f776b91818.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/4983-93a574fcc4538d1a.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/chunks/pages/%5BaliasName%5D/clubs/%5BclubId%5D-454e2be4717cbee5.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/y-nHERL4cJNfYX2w8jaZ7/_buildManifest.js">
  </script> 
  <script defer="" src="https://www.bigc.im/_next/static/y-nHERL4cJNfYX2w8jaZ7/_ssgManifest.js">
  </script> 
  <style>
  </style>
  <style>
  </style>
  <style>
  </style>
  <style>
  </style>
  <style>
  </style>
  <style>
  </style>
<!--   <script async="" src="https://snippet.maze.co/maze-universal-loader.js?apiKey=8cfca7d9-82e0-49b9-9b8a-3edd4b1ea63a"> -->
<!--   </script> -->
<!--   <script async="" src="https://snippet.maze.co/static/14ec20c436866187e846459c84d5cc4eabfb2684/contextualScaffold.js"> -->
<!--   </script> -->
  <style data-styled="active" data-styled-version="6.1.8">
   .dZTOcm{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.wuiiW{white-space:pre-line;}.fDfucp{width:100%;-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-ms-grid-gap:25px;grid-gap:25px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.gefcGj{width:100%;-ms-grid-gap:15px;grid-gap:15px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.kXBRPd{background-color:#F4F6F7;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.jTHFHK{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.bgWiLu{-webkit-box-pack:justify;-webkit-justify-content:space-between;justify-content:space-between;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-flex:1 0 0;-ms-flex:1 0 0;flex:1 0 0;width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.bAhrtu{-webkit-box-pack:end;-ms-flex-pack:end;-webkit-justify-content:flex-end;justify-content:flex-end;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-ms-grid-gap:12px;grid-gap:12px;width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.fdeuKq{-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-ms-grid-gap:30px;grid-gap:30px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.ckvOst{-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-ms-grid-gap:8px;grid-gap:8px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.gzrNVl{-webkit-box-pack:end;-ms-flex-pack:end;-webkit-justify-content:flex-end;justify-content:flex-end;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-ms-grid-gap:7px;grid-gap:7px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.feHHhT{-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.frBnny{-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;width:480px;padding:24px 32px;-ms-grid-gap:20px;grid-gap:20px;border-radius:12px 12px 0px 0px;background-color:#FFFFFF;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.dWLOox{-webkit-flex:1 0 0;-ms-flex:1 0 0;flex:1 0 0;color:#000;font-weight:600;font-size:20px;line-height:normal;white-space:pre-line;}.kYUXps{width:480px;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;padding:0px 32px 24px 32px;-ms-grid-gap:40px;grid-gap:40px;background-color:#FFFFFF;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.eIEPgm{width:100%;-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-ms-grid-gap:40px;grid-gap:40px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.dFxviM{width:100%;-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-ms-grid-gap:24px;grid-gap:24px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.cclSHS{-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-ms-grid-gap:12px;grid-gap:12px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.loanxU{color:#000;font-weight:400;font-size:13px;line-height:normal;white-space:pre-line;}.guvOKU{width:100%;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-ms-grid-gap:12px;grid-gap:12px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.kjvLXj{color:#000;-webkit-flex:1 0 0;-ms-flex:1 0 0;flex:1 0 0;font-weight:400;font-size:13px;line-height:normal;white-space:pre-line;}.egBDNK{width:480px;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;padding:0px 32px 24px 32px;-ms-grid-gap:12px;grid-gap:12px;border-radius:0px 0px 12px 12px;background-color:#FFFFFF;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;white-space:pre-line;}.kNTGrz{-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;-ms-grid-gap:10px;grid-gap:10px;width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:row;-ms-flex-direction:row;flex-direction:row;white-space:pre-line;}.ekCnfh{color:#fff;font-weight:600;font-size:16px;line-height:normal;white-space:pre-line;}.jPTAaW{width:24px;height:18px;}.hrEULS{position:absolute;width:100%;height:100%;}.esrLxS{width:17.6px;height:16px;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;}.fLVAlv{width:12px;height:12px;-webkit-flex-shrink:0;-ms-flex-negative:0;flex-shrink:0;}.cbLUHG{padding:0px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-flex:1 0 0;-ms-flex:1 0 0;flex:1 0 0;width:100%;height:100%;padding:0px 20px;background-color:transparent;border:none;cursor:pointer;box-sizing:border-box;}.ETwMe{padding:0px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;width:50px;height:50px;border-radius:999px;border:1px solid;border-color:rgba(0,0,0, 0.20);background-color:transparent;cursor:pointer;box-sizing:border-box;}.dHzrwY{padding:0px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;width:273px;height:50px;padding:0px 40px;border-radius:999px;border:none;background-color:#000;cursor:pointer;box-sizing:border-box;}.ebBETt{padding:0px;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;width:18px;height:18px;border-radius:4px;background-color:#dcdcdc;border:none;cursor:pointer;box-sizing:border-box;}.GMJvB{padding:0px;width:100%;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;padding:18.5px 16px;-ms-grid-gap:10px;grid-gap:10px;-webkit-flex:1 0 0;-ms-flex:1 0 0;flex:1 0 0;border-radius:8px;background-color:#000;border:none;cursor:pointer;box-sizing:border-box;}.bEPtl{white-space:pre-line;word-break:normal;word-wrap:break-word;overflow-wrap:break-word;letter-spacing:-0.1px;}.fvPYQu{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;height:1.875rem;padding:0.625rem 1.125rem;-webkit-box-pack:end;-ms-flex-pack:end;-webkit-justify-content:flex-end;justify-content:flex-end;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;border-radius:62.4375rem;background:#f3f6f6;gap:0.625rem;font-size:0.75rem;font-style:normal;font-weight:500;line-height:100%;cursor:pointer;}.gztcYl{position:relative;}.gDPEal{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;gap:0.375rem;cursor:pointer;}.iJfHnl{font-size:14px;color:#000;}.gNXEgz{color:#000;font-family:Pretendard;font-size:0.8125rem;font-style:normal;font-weight:500;line-height:100%;}.bbWEDK{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;width:100%;height:100%;-webkit-align-items:flex-start;-webkit-box-align:flex-start;-ms-flex-align:flex-start;align-items:flex-start;}@media screen and (max-width: 780px){.bbWEDK{grid-template-areas:'header' 'main' 'footer';-ms-grid-columns:1fr;grid-template-columns:1fr;}}@media (min-width: 781px) and (max-width: 1279px){.bbWEDK{grid-template-areas:'header' 'main' 'footer';-ms-grid-columns:1fr;grid-template-columns:1fr;}}.hvnqcD{display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-flex-direction:column;-ms-flex-direction:column;flex-direction:column;-webkit-flex:1 0 0;-ms-flex:1 0 0;flex:1 0 0;grid-area:main;width:100%;}@media screen and (max-width: 1279px){.hvnqcD{padding:0;width:100vw;height:100%;}}@media (min-width: 1280px){.hvnqcD{overflow-x:auto;height:100%;}}@media (max-width: 360px){.hvnqcD{height:100%;}.hvnqcD .container{overflow-x:scroll;}}.jCfNQo{color:#fff;text-align:center;font-family:Pretendard;font-size:16px;font-style:normal;font-weight:600;line-height:normal;}.jWGSod{-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;width:100%;height:60px;cursor:pointer;}.jWGSod :hover{background-color:#f9fafa;}.fjRWA-d{color:#000;font-size:15px;font-style:normal;font-weight:500;line-height:100%;letter-spacing:-0.6px;}.dxKGvp{position:fixed;top:0;bottom:0;left:0;right:0;display:-webkit-box;display:-webkit-flex;display:-ms-flexbox;display:flex;-webkit-box-pack:center;-ms-flex-pack:center;-webkit-justify-content:center;justify-content:center;-webkit-align-items:center;-webkit-box-align:center;-ms-flex-align:center;align-items:center;width:100%;height:100%;background:rgba(0, 0, 0, 0.4);z-index:100;}.ggqLsH{color:#888;font-family:Pretendard;font-size:20px;font-style:normal;font-weight:500;line-height:150%;}.eSKyHB{color:#888;font-family:Pretendard;font-size:20px;font-style:normal;font-weight:500;line-height:150%;}
  </style>
  <style data-emotion="css" data-s="">
  </style>
  <style id="googleidentityservice_button_styles">
   .qJTHM{-webkit-user-select:none;color:#202124;direction:ltr;-webkit-touch-callout:none;font-family:"Roboto-Regular",arial,sans-serif;-webkit-font-smoothing:antialiased;font-weight:400;margin:0;overflow:hidden;-webkit-text-size-adjust:100%}.ynRLnc{left:-9999px;position:absolute;top:-9999px}.L6cTce{display:none}.bltWBb{word-break:break-all}.hSRGPd{color:#1a73e8;cursor:pointer;font-weight:500;text-decoration:none}.Bz112c-W3lGp{height:16px;width:16px}.Bz112c-E3DyYd{height:20px;width:20px}.Bz112c-r9oPif{height:24px;width:24px}.Bz112c-uaxL4e{-webkit-border-radius:10px;border-radius:10px}.LgbsSe-Bz112c{display:block}.S9gUrf-YoZ4jf,.S9gUrf-YoZ4jf *{border:none;margin:0;padding:0}.fFW7wc-ibnC6b>.aZ2wEe>div{border-color:#4285f4}.P1ekSe-ZMv3u>div:nth-child(1){background-color:#1a73e8!important}.P1ekSe-ZMv3u>div:nth-child(2),.P1ekSe-ZMv3u>div:nth-child(3){background-image:linear-gradient(to right,rgba(255,255,255,.7),rgba(255,255,255,.7)),linear-gradient(to right,#1a73e8,#1a73e8)!important}.haAclf{display:inline-block}.nsm7Bb-HzV7m-LgbsSe{-webkit-border-radius:4px;border-radius:4px;-webkit-box-sizing:border-box;box-sizing:border-box;-webkit-transition:background-color .218s,border-color .218s;transition:background-color .218s,border-color .218s;-webkit-user-select:none;-webkit-appearance:none;background-color:#fff;background-image:none;border:1px solid #dadce0;color:#3c4043;cursor:pointer;font-family:"Google Sans",arial,sans-serif;font-size:14px;height:40px;letter-spacing:0.25px;outline:none;overflow:hidden;padding:0 12px;position:relative;text-align:center;vertical-align:middle;white-space:nowrap;width:auto}@media screen and (-ms-high-contrast:active){.nsm7Bb-HzV7m-LgbsSe{border:2px solid windowText;color:windowText}}.nsm7Bb-HzV7m-LgbsSe.pSzOP-SxQuSe{font-size:14px;height:32px;letter-spacing:0.25px;padding:0 10px}.nsm7Bb-HzV7m-LgbsSe.purZT-SxQuSe{font-size:11px;height:20px;letter-spacing:0.3px;padding:0 8px}.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe{padding:0;width:40px}.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe.pSzOP-SxQuSe{width:32px}.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe.purZT-SxQuSe{width:20px}.nsm7Bb-HzV7m-LgbsSe.JGcpL-RbRzK{-webkit-border-radius:20px;border-radius:20px}.nsm7Bb-HzV7m-LgbsSe.JGcpL-RbRzK.pSzOP-SxQuSe{-webkit-border-radius:16px;border-radius:16px}.nsm7Bb-HzV7m-LgbsSe.JGcpL-RbRzK.purZT-SxQuSe{-webkit-border-radius:10px;border-radius:10px}.nsm7Bb-HzV7m-LgbsSe.MFS4be-Ia7Qfc{border:none;color:#fff}.nsm7Bb-HzV7m-LgbsSe.MFS4be-v3pZbf-Ia7Qfc{background-color:#1a73e8}.nsm7Bb-HzV7m-LgbsSe.MFS4be-JaPV2b-Ia7Qfc{background-color:#202124;color:#e8eaed}.nsm7Bb-HzV7m-LgbsSe .nsm7Bb-HzV7m-LgbsSe-Bz112c{height:18px;margin-right:8px;min-width:18px;width:18px}.nsm7Bb-HzV7m-LgbsSe.pSzOP-SxQuSe .nsm7Bb-HzV7m-LgbsSe-Bz112c{height:14px;min-width:14px;width:14px}.nsm7Bb-HzV7m-LgbsSe.purZT-SxQuSe .nsm7Bb-HzV7m-LgbsSe-Bz112c{height:10px;min-width:10px;width:10px}.nsm7Bb-HzV7m-LgbsSe.jVeSEe .nsm7Bb-HzV7m-LgbsSe-Bz112c{margin-left:8px;margin-right:-4px}.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe .nsm7Bb-HzV7m-LgbsSe-Bz112c{margin:0;padding:10px}.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe.pSzOP-SxQuSe .nsm7Bb-HzV7m-LgbsSe-Bz112c{padding:8px}.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe.purZT-SxQuSe .nsm7Bb-HzV7m-LgbsSe-Bz112c{padding:4px}.nsm7Bb-HzV7m-LgbsSe .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{-webkit-border-top-left-radius:3px;border-top-left-radius:3px;-webkit-border-bottom-left-radius:3px;border-bottom-left-radius:3px;display:-webkit-box;display:-webkit-flex;display:flex;justify-content:center;-webkit-align-items:center;align-items:center;background-color:#fff;height:36px;margin-left:-10px;margin-right:12px;min-width:36px;width:36px}.nsm7Bb-HzV7m-LgbsSe .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf .nsm7Bb-HzV7m-LgbsSe-Bz112c,.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf .nsm7Bb-HzV7m-LgbsSe-Bz112c{margin:0;padding:0}.nsm7Bb-HzV7m-LgbsSe.pSzOP-SxQuSe .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{height:28px;margin-left:-8px;margin-right:10px;min-width:28px;width:28px}.nsm7Bb-HzV7m-LgbsSe.purZT-SxQuSe .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{height:16px;margin-left:-6px;margin-right:8px;min-width:16px;width:16px}.nsm7Bb-HzV7m-LgbsSe.Bz112c-LgbsSe .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{-webkit-border-radius:3px;border-radius:3px;margin-left:2px;margin-right:0;padding:0}.nsm7Bb-HzV7m-LgbsSe.JGcpL-RbRzK .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{-webkit-border-radius:18px;border-radius:18px}.nsm7Bb-HzV7m-LgbsSe.pSzOP-SxQuSe.JGcpL-RbRzK .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{-webkit-border-radius:14px;border-radius:14px}.nsm7Bb-HzV7m-LgbsSe.purZT-SxQuSe.JGcpL-RbRzK .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{-webkit-border-radius:8px;border-radius:8px}.nsm7Bb-HzV7m-LgbsSe .nsm7Bb-HzV7m-LgbsSe-bN97Pc-sM5MNb{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-align-items:center;align-items:center;-webkit-flex-direction:row;flex-direction:row;justify-content:space-between;-webkit-flex-wrap:nowrap;flex-wrap:nowrap;height:100%;position:relative;width:100%}.nsm7Bb-HzV7m-LgbsSe .oXtfBe-l4eHX{justify-content:center}.nsm7Bb-HzV7m-LgbsSe .nsm7Bb-HzV7m-LgbsSe-BPrWId{-webkit-flex-grow:1;flex-grow:1;font-family:"Google Sans",arial,sans-serif;font-weight:500;overflow:hidden;text-overflow:ellipsis;vertical-align:top}.nsm7Bb-HzV7m-LgbsSe.purZT-SxQuSe .nsm7Bb-HzV7m-LgbsSe-BPrWId{font-weight:300}.nsm7Bb-HzV7m-LgbsSe .oXtfBe-l4eHX .nsm7Bb-HzV7m-LgbsSe-BPrWId{-webkit-flex-grow:0;flex-grow:0}.nsm7Bb-HzV7m-LgbsSe .nsm7Bb-HzV7m-LgbsSe-MJoBVe{-webkit-transition:background-color .218s;transition:background-color .218s;bottom:0;left:0;position:absolute;right:0;top:0}.nsm7Bb-HzV7m-LgbsSe:hover,.nsm7Bb-HzV7m-LgbsSe:focus{-webkit-box-shadow:none;box-shadow:none;border-color:rgb(210,227,252);outline:none}.nsm7Bb-HzV7m-LgbsSe:hover .nsm7Bb-HzV7m-LgbsSe-MJoBVe,.nsm7Bb-HzV7m-LgbsSe:focus .nsm7Bb-HzV7m-LgbsSe-MJoBVe{background:rgba(66,133,244,.04)}.nsm7Bb-HzV7m-LgbsSe:active .nsm7Bb-HzV7m-LgbsSe-MJoBVe{background:rgba(66,133,244,.1)}.nsm7Bb-HzV7m-LgbsSe.MFS4be-Ia7Qfc:hover .nsm7Bb-HzV7m-LgbsSe-MJoBVe,.nsm7Bb-HzV7m-LgbsSe.MFS4be-Ia7Qfc:focus .nsm7Bb-HzV7m-LgbsSe-MJoBVe{background:rgba(255,255,255,.24)}.nsm7Bb-HzV7m-LgbsSe.MFS4be-Ia7Qfc:active .nsm7Bb-HzV7m-LgbsSe-MJoBVe{background:rgba(255,255,255,.32)}.nsm7Bb-HzV7m-LgbsSe .n1UuX-DkfjY{-webkit-border-radius:50%;border-radius:50%;display:-webkit-box;display:-webkit-flex;display:flex;height:20px;margin-left:-4px;margin-right:8px;min-width:20px;width:20px}.nsm7Bb-HzV7m-LgbsSe.jVeSEe .nsm7Bb-HzV7m-LgbsSe-BPrWId{font-family:"Roboto";font-size:12px;text-align:left}.nsm7Bb-HzV7m-LgbsSe.jVeSEe .nsm7Bb-HzV7m-LgbsSe-BPrWId .ssJRIf,.nsm7Bb-HzV7m-LgbsSe.jVeSEe .nsm7Bb-HzV7m-LgbsSe-BPrWId .K4efff .fmcmS{overflow:hidden;text-overflow:ellipsis}.nsm7Bb-HzV7m-LgbsSe.jVeSEe .nsm7Bb-HzV7m-LgbsSe-BPrWId .K4efff{display:-webkit-box;display:-webkit-flex;display:flex;-webkit-align-items:center;align-items:center;color:#5f6368;fill:#5f6368;font-size:11px;font-weight:400}.nsm7Bb-HzV7m-LgbsSe.jVeSEe.MFS4be-Ia7Qfc .nsm7Bb-HzV7m-LgbsSe-BPrWId .K4efff{color:#e8eaed;fill:#e8eaed}.nsm7Bb-HzV7m-LgbsSe.jVeSEe .nsm7Bb-HzV7m-LgbsSe-BPrWId .K4efff .Bz112c{height:18px;margin:-3px -3px -3px 2px;min-width:18px;width:18px}.nsm7Bb-HzV7m-LgbsSe.jVeSEe .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{-webkit-border-top-left-radius:0;border-top-left-radius:0;-webkit-border-bottom-left-radius:0;border-bottom-left-radius:0;-webkit-border-top-right-radius:3px;border-top-right-radius:3px;-webkit-border-bottom-right-radius:3px;border-bottom-right-radius:3px;margin-left:12px;margin-right:-10px}.nsm7Bb-HzV7m-LgbsSe.jVeSEe.JGcpL-RbRzK .nsm7Bb-HzV7m-LgbsSe-Bz112c-haAclf{-webkit-border-radius:18px;border-radius:18px}.L5Fo6c-sM5MNb{border:0;display:block;left:0;position:relative;top:0}.L5Fo6c-bF1uUb{-webkit-border-radius:4px;border-radius:4px;bottom:0;cursor:pointer;left:0;position:absolute;right:0;top:0}.L5Fo6c-bF1uUb:focus{border:none;outline:none}sentinel{}
  </style>
  <script async="" src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/315497884/?random=1740463995807&amp;cv=11&amp;fst=1740463995807&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=45be52o0v893030600z89175504194za200zb9175504194&amp;gcd=13l3l3l3l1l1&amp;dma=0&amp;tag_exp=101732282~101732284~102067808~102482433~102539968~102558064~102587591~102605417~102640600~102658453&amp;u_w=1920&amp;u_h=1080&amp;url=https%3A%2F%2Fwww.bigc.im%2FYUURI%2Fclubs%2FW8K5332Z65&amp;hn=www.googleadservices.com&amp;frm=0&amp;tiba=%EC%9C%A0%EC%9A%B0%EB%A6%AC%20(YUURI)%20%7C%20%5BTICKET%5D%20YUURI%20ARENA%20LIVE%202025%20at%20SEOUL&amp;npa=0&amp;pscdl=noapi&amp;auid=538802882.1740463995&amp;uaa=x86&amp;uab=64&amp;uafvl=Not(A%253ABrand%3B99.0.0.0%7CGoogle%2520Chrome%3B133.0.6943.127%7CChromium%3B133.0.6943.127&amp;uamb=0&amp;uam=&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;fledge=1&amp;data=event%3Dgtag.config&amp;rfmt=3&amp;fmt=4" type="text/javascript">
  </script> 
  <link as="script" href="https://www.bigc.im/_next/static/chunks/ea88be26-62312c416727d64c.js" rel="prefetch"/>
  <link as="script" href="https://www.bigc.im/_next/static/chunks/3626-00febadb3be0ba31.js" rel="prefetch"/>
  <link as="script" href="https://www.bigc.im/_next/static/chunks/1778-7d5e2dd5a5d38cf3.js" rel="prefetch"/>
  <link as="script" href="https://www.bigc.im/_next/static/chunks/3890-7b0fa03a13c79508.js" rel="prefetch"/>
  <link as="script" href="https://www.bigc.im/_next/static/chunks/1704-fcaaa95031746cbd.js" rel="prefetch"/>
  <link as="script" href="https://www.bigc.im/_next/static/chunks/pages/index-6a2283b5c1fd259b.js" rel="prefetch"/>
  <link as="script" href="https://www.bigc.im/_next/static/chunks/4370-3cb3e5a9c5551961.js" rel="prefetch"/>
  <link as="script" href="https://www.bigc.im/_next/static/chunks/pages/%5BaliasName%5D-be453ac687323303.js" rel="prefetch"/>
  <script async="" attributionsrc="" src="https://www.googleadservices.com/pagead/conversion/16796759376/?random=1740463996103&amp;cv=11&amp;fst=1740463996103&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=45be52o0v9200907001z89175504194za201zb893030600&amp;gcd=13l3l3l3l1l1&amp;dma=0&amp;tag_exp=101732279~101732281~102067808~102482433~102539968~102558064~102587591~102605417~102640600~102658453&amp;u_w=1920&amp;u_h=1080&amp;url=https%3A%2F%2Fwww.bigc.im%2FYUURI%2Fclubs%2FW8K5332Z65&amp;label=_-uyCKyq7O8ZENDqqMk-&amp;hn=www.googleadservices.com&amp;frm=0&amp;tiba=%EC%9C%A0%EC%9A%B0%EB%A6%AC%20(YUURI)%20%7C%20%5BTICKET%5D%20YUURI%20ARENA%20LIVE%202025%20at%20SEOUL&amp;value=0&amp;currency_code=JPY&amp;bttype=purchase&amp;npa=0&amp;pscdl=noapi&amp;auid=538802882.1740463995&amp;uaa=x86&amp;uab=64&amp;uafvl=Not(A%253ABrand%3B99.0.0.0%7CGoogle%2520Chrome%3B133.0.6943.127%7CChromium%3B133.0.6943.127&amp;uamb=0&amp;uam=&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;fledge=1&amp;capi=1&amp;rfmt=3&amp;fmt=4" type="text/javascript">
  </script>
  
  <script src="../js/ticket/offlineTicketView.js"></script>
  
  
  
  
  
 </head>
 <body style="overflow: hidden;">
  <div id="__next">
   <div id="modal-root">
   </div>
   <div id="account-modal-mobile">
   </div>
   <div id="alert-modal">
   </div>
   <main class="__variable_57cb75 w-[100%] flex css-ujeax4">
    <div class="sc-itwRVv bbWEDK" id="home-page">
     <div class="sc-CWyWW hvnqcD" id="content-container">
      <div class="flex flex-col w-full css-1ddhp56" id="brandhome-layout">
       <div class="mobile:min-w-[1320px] w-full">
        <div class="mobile:hidden z-[100]">
         <div class="flex flex-col py-[20px] layout-x-padding border-b-[1px] border-[#DDDDDD]">
          <div class="flex items-center justify-between">
           <div class="min-w-[300px] flex flex-row gap-[20px] items-center">
            <a href="https://www.bigc.im/">
             <img alt="bigc-logo" class="sc-dmyCSP jPTAaW" height="18px" src="https://www.bigc.im/images/logo/logo_small_bk.svg" width="24px"/>
            </a>
            <a href="https://www.bigc.im/YUURI">
             <div class="max-w-[300px] font-[600] text-[24px] leading-[24px] text-black">
              유우리 (YUURI)
             </div>
            </a>
           </div>
           <svg fill="none" height="22" width="30" xmlns="http://www.w3.org/2000/svg">
            <path class="hamberger_svg__myRect" d="M0 0h30v2H0zM0 10h30v2H0zM0 20h30v2H0z" fill="#000">
            </path>
           </svg>
          </div>
         </div>
        </div>
        <header class="flex justify-center sticky top-0 z-[100] bg-white border-b-[1px] mobile:border-[#DDDDDD] border-none">
         <div class="container layout-x-padding">
          <div class="items-center justify-between mobile:flex hidden min-h-[100px]">
           <div class="flex">
            <div class="min-w-[300px] flex flex-row gap-[20px] items-center">
             <a href="https://www.bigc.im/">
              <img alt="bigc-logo" class="sc-dmyCSP jPTAaW" height="18px" src="https://www.bigc.im/images/logo/logo_small_bk.svg" width="24px"/>
             </a>
             <a href="https://www.bigc.im/YUURI">
              <div class="max-w-[300px] font-[600] text-[24px] leading-[24px] text-black">
               유우리 (YUURI)
              </div>
             </a>
            </div>
            <div class="flex items-center css-6ao2z4">
             <div class="last:mr-0 mr-[40px]">
              <div class="font-bold text-[16px] leading-[16px] text-[#888888] relative cursor-pointer css-qvklll">
               HOME
              </div>
             </div>
             <div class="last:mr-0 mr-[40px]">
              <div class="font-bold text-[16px] leading-[16px] text-[#888888] relative cursor-pointer css-1d5pdbr">
               EVENT
               <div class="absolute w-full h-[3px] bg-[#FF1B94] bottom-[-6px]">
               </div>
              </div>
             </div>
             <div class="last:mr-0 mr-[40px]">
              <div class="font-bold text-[16px] leading-[16px] text-[#888888] relative cursor-pointer css-qvklll">
               CONTENT
              </div>
             </div>
             <div class="last:mr-0 mr-[40px]">
              <div class="font-bold text-[16px] leading-[16px] text-[#888888] relative cursor-pointer css-qvklll">
               COMMUNITY
              </div>
             </div>
            </div>
           </div>
           <div class="flex items-center gap-3">
            <div class="sc-jPpdYo gztcYl">
             <div class="sc-ftxyOh gDPEal">
              <i class="sc-fbbrMC iJfHnl bcon ic-new-global">
              </i>
              <p class="sc-FjMCv gNXEgz">
               한국어
              </p>
              <svg fill="none" height="16" width="16" xmlns="http://www.w3.org/2000/svg">
               <path d="M5.8 6.545A.56.56 0 0 0 5.495 7c0 .196.081.292 1.113 1.328.553.554 1.051 1.039 1.106 1.077a.57.57 0 0 0 .463.061c.081-.026.32-.249 1.125-1.049.561-.56 1.056-1.07 1.099-1.134q.214-.322-.035-.607a.49.49 0 0 0-.573-.128c-.065.027-.387.328-.946.886L8 8.278l-.847-.844c-.559-.558-.881-.859-.946-.886a.58.58 0 0 0-.407-.003" fill="#000" fill-rule="evenodd">
               </path>
              </svg>
             </div>
            </div>
            <div class="sc-hnmNqB fvPYQu">
             LOGIN
            </div>
           </div>
          </div>
         </div>
        </header>
        <section>
         <div class="sc-guDLey sc-cbDaos dZTOcm" display="flex">
          <article class="flex container px-[40px] gap-[60px] my-[80px] items-start">
           <div class="sc-guDLey sc-cQXfRj wuiiW dxKGvp">
            <div class="sc-guDLey sc-cbDaos feHHhT" display="flex">
             <div class="sc-guDLey sc-iVheDh frBnny" display="flex" width="480px">
              <div class="sc-guDLey sc-kiTBBF sc-hVcFVo dWLOox bEPtl kLABNP" color="#000">
               필수 확인 안내 사항
              </div>
             </div>
             <div class="sc-guDLey sc-cbDaos kYUXps" display="flex" width="480px">
              <div class="sc-guDLey sc-cbDaos eIEPgm" display="flex" width="100%">
               <div class="sc-guDLey sc-cbDaos dFxviM" display="flex" width="100%">
                <div class="sc-guDLey sc-cbDaos cclSHS" display="flex">
                 <div class="sc-guDLey sc-kiTBBF sc-hVcFVo loanxU bEPtl kLABNP" color="#000">
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    ※ 예매자는 본 공연 페이지의 공연 관람 수칙 안내에 대하여 모두 숙지 및 동의한 것으로 간주합니다.
                   </span>
                  </p>
                  <p>
                   -
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    예매 티켓 수령/증빙, 관람 연령, 공연 장소, 교통/주차, 좌석에 따른 안내 미숙지는 관람자 본인에게 책임이 있으며, 해당 사유로 인한 예매 티켓의 취소/환불/변경은 불가합니다.
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 공연 관람에 불이익을 받지 않도록 관람 전 안내사항을 반드시 확인해 주시기 바랍니다.
                   </span>
                  </p>
                  <p>
                   <br/>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    ※ 12세 이상 관람가
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 본 공연은 12세 이상 관람가로, 입장 연령 미만은 티켓 소지/보호자 동반 여부와 관계없이 객석입장이 불가합니다.
                   </span>
                  </p>
                  <p>
                   <br/>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    ※ 공연 관람 안내
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 티켓의 취소/변경/환불은 공식 예매처인 빅크를 통해서만 가능하며, 예매/취소 마감시간 이후 공연 당일에는 취소/변경/환불이 불가합니다.
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 공식 예매처 외 다른 경로를 통한 입장권 구매, 위조, 양도, 구매 대행 추가 비용을 지불하여 티켓을 구매하는 등의 위법 행위를 엄격히 금지하고 있습니다.
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 공연 당일 현장 판매는 예매 마감 후 잔여석에 한하여 진행되며, 매진 시 현장 판매는 진행되지 않습니다.
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    ※불법 거래(프리미엄 티켓 판매, 티켓 양도 사기)로 발생하는 불이익에 관하여 제작사 및 예매처에서는 책임을 지지 않습니다. 반드시 정식 예매처를 통해 예매해주시기 바랍니다.
                   </span>
                  </p>
                  <p>
                   <br/>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    ※ 티켓 허위 구매에 대한 규제 방침
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    서비스의 선량한 이용자 보호를 위하여 회사는 다음에 해당하는 고객에 대하여 예매 취소 조치를 취할 수 있습니다.
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 티켓 예매 진행 시 부정한 방법을 통합 예매 (매크로 사용 비정상적인 방법을 통한 예매 , 브라우저 탭을 여러 개 띄워 티켓팅 시도 할 경우)
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 다량의 티켓의 구매 후 취소를 반복하는 경우
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 암표 매매의 목적으로 구매한 경우 또는 암표 매매를 한 이력이 있을 경우 (구매한 티켓을 회사의 판매가보다 높은 가격을 받고 판매한 경우)
                   </span>
                  </p>
                  <p>
                   <span style="background-color: rgba(232, 232, 232, 0.04);">
                    - 기타 이에 준하는 부정적인 서비스 이용으로 판단되는 경우
                   </span>
                  </p>
                 </div>
                </div>
               </div>
              </div>
              <div class="sc-guDLey sc-iVheDh guvOKU" display="flex" width="100%">
               <button class="sc-csKJxZ ebBETt" display="flex" height="18px" width="18px">
                <img class="sc-dmyCSP fLVAlv" height="12px" src="https://www.bigc.im/icons/seatsio/ic_checked.svg" width="12px"/>
               </button>
               <div class="sc-guDLey sc-kiTBBF sc-hVcFVo kjvLXj bEPtl kLABNP" color="#000">
                오늘 하루동안 보지 않기
               </div>
              </div>
             </div>
             <div class="sc-guDLey sc-cbDaos egBDNK" display="flex" width="480px">
              <div class="sc-guDLey sc-iVheDh kNTGrz" display="flex" width="100%">
               <button class="sc-csKJxZ GMJvB" display="flex" width="100%">
                <div class="sc-guDLey sc-kiTBBF sc-hVcFVo ekCnfh bEPtl kLABNP" color="#fff">
                 확인
                </div>
               </button>
              </div>
             </div>
            </div>
           </div>
           <div class="aspect-square relative w-[600px]">
            <img alt="club" class="sc-dmyCSP hrEULS" height="100%" src="https://cdn.bigc.im/uploads/attachments/2025/02/12/0s0ZaB7Bf4KIfAXvgbgcv3jSaLS7U1QkAWbcMl3h.jpg" style="object-fit: cover; inset: 0px;" width="100%"/>
           </div>
           <div class="flex flex-col flex-1 relative gap-[30px]">
            <div class="absolute top-0 right-0">
             <button aria-controls="radix-:r0:" aria-expanded="false" aria-haspopup="dialog" class="bcon ic-new-share text-[24px]" data-state="closed" type="button">
             </button>
            </div>
            <i class="shrink-0 text-[12px] legacyTablet:text-[13px] h-[26px] legacyTablet:h-[30px] font-[500] leading-none not-italic px-[12px] legacyTablet:px-[14px] border-[2px] w-max rounded-[4px] flex items-center text-pink border-pink">
             판매중
            </i>
            <div class="flex flex-col gap-[20px]">
             <p class="text-[#00000080] text-[13px]">
              Ticket
             </p>
             <p class="text-[24px] leading-[1.4] font-[600] tracking-[-0.48px]">
              [TICKET] YUURI ARENA LIVE 2025 at SEOUL
             </p>
             <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-cBBoUG wuiiW bEPtl kLABNP ggqLsH">
             </div>
             <a class="flex items-center gap-[8px]" href="https://www.bigc.im/YUURI">
              <img alt="avatar" class="object-cover rounded-full css-n0lkpj" data-nimg="1" decoding="async" height="34" loading="lazy" src="https://www.bigc.im/_next/image?url=https%3A%2F%2Fcdn.bigc.im%2Fuploads%2Favatars%2F2025%2F02%2F11%2FTpvnDqRPmajHfxVC6FY88yJPIfNBquGfkpwLwJeq.png&amp;w=96&amp;q=75" srcset="https://www.bigc.im/_next/image?url=https%3A%2F%2Fcdn.bigc.im%2Fuploads%2Favatars%2F2025%2F02%2F11%2FTpvnDqRPmajHfxVC6FY88yJPIfNBquGfkpwLwJeq.png&amp;w=48&amp;q=75 1x, https://www.bigc.im/_next/image?url=https%3A%2F%2Fcdn.bigc.im%2Fuploads%2Favatars%2F2025%2F02%2F11%2FTpvnDqRPmajHfxVC6FY88yJPIfNBquGfkpwLwJeq.png&amp;w=96&amp;q=75 2x" style="color: transparent;" width="34"/>
              <p class="text-[15px] tracking-[-0.6px] leading-none font-[500]">
               유우리 (YUURI)
              </p>
             </a>
            </div>
            <div class="sc-guDLey sc-cbDaos fDfucp" display="flex" width="100%">
             <div class="sc-guDLey sc-cbDaos gefcGj" display="flex" width="100%">
              <p class="text-[13px] text-[#00000080]">
               통화선택
              </p>
              <details class="relative">
               <summary class="z-10">
                <div class="border border-[#00000033] rounded-[4px] flex items-center px-[20px] gap-[6px] hover:bg-hover h-[56px]">
                 <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full items-center flex ic-new-krw text-[8px] css-bxy6ch">
                 </i>
                 <p class="text-[13px]">
                  KRW
                 </p>
                 <i class="bcon ic-new-angle-down text-[6px] ml-[auto]">
                 </i>
                </div>
               </summary>
               <div class="z-20 absolute top-[100%] inset-x-0">
                <ul class="border mt-[10px] border-[#00000033] rounded-[4px] overflow-hidden bg-white css-ne2uih">
                 <li class="flex h-[60px] items-center px-[20px] legacyTablet:hover:bg-hover cursor-pointer gap-[6px]">
                  <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full flex items-center ic-new-krw text-[8px]">
                  </i>
                  <p class="text-[13px]">
                   KRW
                  </p>
                 </li>
                 <li class="flex h-[60px] items-center px-[20px] legacyTablet:hover:bg-hover cursor-pointer gap-[6px]">
                  <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full flex items-center ic-new-usd text-[14px]">
                  </i>
                  <p class="text-[13px]">
                   USD
                  </p>
                 </li>
                 <li class="flex h-[60px] items-center px-[20px] legacyTablet:hover:bg-hover cursor-pointer gap-[6px]">
                  <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full flex items-center ic-new-jpy text-[14px]">
                  </i>
                  <p class="text-[13px]">
                   JPY
                  </p>
                 </li>
                </ul>
               </div>
              </details>
             </div>
             <div class="sc-guDLey sc-cbDaos gefcGj" display="flex" width="100%">
              <p class="text-[13px] text-[#00000080]">
               공연선택
              </p>
              <details class="relative">
               <summary class="z-10">
                <div class="sc-guDLey sc-iVheDh kXBRPd border border-[#00000033] rounded-[4px] flex items-center px-[20px] gap-[6px] hover:bg-hover h-[56px] text-[15px]" display="flex">
                 <p class="text-[#888] leading-none">
                  공연을 선택해주세요.
                 </p>
                 <i class="bcon ic-new-angle-down text-[6px] ml-[auto]">
                 </i>
                </div>
               </summary>
               <div class="z-20 absolute top-[100%] inset-x-0">
                <ul class="border mt-[10px] border-[#00000033] rounded-[4px] bg-white css-ne2uih">
                 <div class="sc-guDLey sc-iVheDh sc-hVsJot jTHFHK jWGSod" display="flex">
                  <button class="sc-csKJxZ cbLUHG" display="flex" height="100%" width="100%">
                   <div class="sc-guDLey sc-iVheDh bgWiLu" display="flex" width="100%">
                    <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-fImfOe wuiiW bEPtl kLABNP fjRWA-d">
                     DAY 1 : 2025-05-03 18:00 (KST)
                    </div>
                   </div>
                  </button>
                 </div>
                 <div class="sc-guDLey sc-iVheDh sc-hVsJot jTHFHK jWGSod" display="flex">
                  <button class="sc-csKJxZ cbLUHG" display="flex" height="100%" width="100%">
                   <div class="sc-guDLey sc-iVheDh bgWiLu" display="flex" width="100%">
                    <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-fImfOe wuiiW bEPtl kLABNP fjRWA-d">
                     DAY 2 : 2025-05-04 17:00 (KST)
                    </div>
                   </div>
                  </button>
                 </div>
                </ul>
               </div>
              </details>
             </div>
            </div>
             <!-- 
            <div class="sc-guDLey sc-iVheDh bAhrtu" display="flex" width="100%">
             <button class="sc-csKJxZ ETwMe" display="flex" height="50px" width="50px">
              <img class="sc-dmyCSP esrLxS" height="16px" src="/icons/club/ic_heart.svg" style="fill: rgb(187, 187, 187); cursor: pointer;" width="17.6px"/>
             </button>
             <button class="sc-csKJxZ dHzrwY loginBtn" display="flex" height="50px" width="273px">
              <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-hbaYEB wuiiW bEPtl kLABNP jCfNQo ">
               로그인하기
              </div>
             </button>
            </div>
              -->
           </div>
          </article>
         </div>
         <article class="sticky z-10 bg-white border-b border-b-[#00000033] css-vqoxdd">
          <ul class="container px-[40px] flex">
           <li class="w-[150px] h-[66px] text-[15px] legacyTablet:text-[18px] font-[500] legacyTablet:font-[700] text-center border-b-[2px] cursor-pointer flex justify-center items-center false css-c2ztun">
            상세정보
           </li>
           <li class="w-[150px] h-[66px] text-[15px] legacyTablet:text-[18px] font-[500] legacyTablet:font-[700] text-center border-b-[2px] cursor-pointer flex justify-center items-center false css-1nnux74">
            FAQ
           </li>
          </ul>
         </article>
         <div class="container px-[40px] flex gap-[60px] my-[80px]">
          <ul class="w-[860px] flex flex-col gap-[100px] css-18545tv">
           <li>
            <div class="relative">
             <div class="absolute css-1mdhxr1" data-hash="detail" id="detail">
             </div>
            </div>
            <section>
             <div class="ql-editor ql-content whitespace-pre-line">
              <p>
               <img src="https://cdn.bigc.im/uploads/attachments/2025/02/11/3BL9zh77yPglu66EB9If1ZjfEdZZVLNl0CAXEF1N.png"/>
              </p>
             </div>
            </section>
           </li>
           <li>
            <div class="relative">
             <div class="absolute css-1ny3zma" data-hash="faq" id="faq">
             </div>
            </div>
            <section>
             <p class="text-[24px] font-[600] mb-[25px] legacyTablet:mb-[40px]">
              FAQ
             </p>
             <ul class="border-t-[2px] border-t-black">
              <details class="border-b border-b-[#00000033]">
               <summary class="text-[15px] flex items-center gap-[20px] cursor-pointer py-[28px] px-[12px] legacyTablet:hover:bg-hover">
                <i class="bcon ic-new-q">
                </i>
                <p class="flex-1 leading-none">
                 책임 한계 고지 안내 /  Legal Notice
                </p>
                <i class="ml-[8px] text-[6px] bcon ic-new-angle-down">
                </i>
               </summary>
               <div class="py-[20px] legacyTablet:py-[40px] px-[12px] ql-editor whitespace-pre-line animate__animated false">
                <p>
                 빅크(주)는 통신판매중개자이며, 통신판매의 당사자가 아닙니다. 회사가 직접 기획, 판매하는 상품을 제외하고는 모든 콘텐츠, 상품, 상품정보 거래에 관한 의무와 책임은 크리에이터(판매자)에게 있습니다.
                 <br/>
                 <a href="https://www.notion.so/bigc-im/2fd1b01e888c4bcab5d4f133a026da83#f180744617304daf84e3955d71efb972" target="_blank">
                  [자세히 보기 &gt;]
                 </a>
                </p>
                <hr/>
                <p>
                 Recording or extracting this content, broadcasting or streaming to multiple viewers, or any other use of this content other than viewing through the official viewing page and application is strictly prohibited.
                </p>
                <p>
                 Any discovery of the above-listed illegal activities, as well as the unauthorized distribution and modification of this content, may lead to legal sanctions due to copyright infringement.
                </p>
               </div>
              </details>
              <details class="border-b border-b-[#00000033]">
               <summary class="text-[15px] flex items-center gap-[20px] cursor-pointer py-[28px] px-[12px] legacyTablet:hover:bg-hover">
                <i class="bcon ic-new-q">
                </i>
                <p class="flex-1 leading-none">
                 환불 규정 안내
                </p>
                <i class="ml-[8px] text-[6px] bcon ic-new-angle-down">
                </i>
               </summary>
               <div class="py-[20px] legacyTablet:py-[40px] px-[12px] ql-editor whitespace-pre-line animate__animated false">
                <p>
                 <strong>
                  [환불 규정]
                 </strong>
                </p>
                <ul>
                 <li>
                  환불 접수는 고객센터를 통해 접수하신 시점을 기준으로 적용합니다.
                 </li>
                 <li>
                  예매취소 시점과 결제 시 사용하신 결제수단의 환불 처리 기준에 따라 취소금액의 환급방법과 환급일은 다소 차이가 있을 수 있습니다.
                 </li>
                 <li>
                  취소일자에 따라 아래와 같이 취소 수수료가 부과됩니다.
                 </li>
                </ul>
                <p>
                 <br/>
                </p>
                <p>
                 <strong>
                  [환불 수수료 정책] *
                 </strong>
                 결제일 기준 취소 요청시*
                </p>
                <p>
                 <strong>
                  결제 당일
                 </strong>
                 : 전액 환불
                </p>
                <p>
                 <strong>
                  결제 후 7일 이내
                 </strong>
                 : 서비스 수수료를 제외한 전액 환불
                </p>
                <p>
                 <strong>
                  결제 후 8일 ~ 공연일 10일이내
                 </strong>
                 : 장당 4,000원(10% 한도) + 서비스 수수료공연일 전 취소 요청 시
                </p>
                <p>
                 <strong>
                  공연일 9일 전 ~ 7일 전
                 </strong>
                 : 티켓금액의 10% + 서비스 수수료
                </p>
                <p>
                 <strong>
                  공연일 6일 전 ~ 3일 전
                 </strong>
                 : 티켓 금액의 20% + 서비스 수수료
                </p>
                <p>
                 <strong>
                  공연일 2일 전 ~ 1일 전
                 </strong>
                 : 티켓 금액의 30% + 서비스 수수료
                </p>
                <p>
                 <strong>
                  공연 당일
                 </strong>
                 : 환불 불가
                </p>
                <ul>
                 <li>
                  환불 시, 서비스 수수료는 제외하고 환불됩니다.
                 </li>
                 <li>
                  위 정책은 공연일 기준 정책을 최우선으로 합니다.
                 </li>
                </ul>
                <p>
                 <br/>
                </p>
                <p>
                 <strong>
                  [환불 정책 유의사항]
                 </strong>
                </p>
                <ul>
                 <li>
                  결제 당일 취소의 경우, 해당 일자의 자정(23:59)까지 접수된 건에 한해 전액 환불처리가 가능합니다.
                 </li>
                 <li>
                  일자의 기준은 1일을 24시간 단위로 계산하며, 공연 당일 00시부터 공연 시간까지를 당일로 간주합니다.
                 </li>
                 <li>
                  결제일 기준 환불 요청의 경우, 공연일 기준 정책을 최우선으로 적용하여 당일 결제한 건에 대해 환불을 접수하셔도 취소 수수료가 부과될 수 있습니다.
                 </li>
                 <li>
                  공연 당일 구매한 티켓은 시스템 오류 등 예외적인 상황을 제외하고 환불이 불가합니다.
                 </li>
                 <li>
                  현금 결제 수단(편의점 결제 / 가상계좌 등) 의 경우, 판매 종료일 기준 5일 전까지만 신청 가능합니다.
                 </li>
                </ul>
                <p>
                 <br/>
                </p>
                <p>
                 *공연 시작 시간은 상세페이지에 기재되어있는 시작 시간을 기준으로 합니다.
                </p>
               </div>
              </details>
             </ul>
            </section>
           </li>
          </ul>
          <div class="sc-guDLey sc-cbDaos fdeuKq" display="flex">
           <i class="shrink-0 text-[12px] legacyTablet:text-[13px] h-[26px] legacyTablet:h-[30px] font-[500] leading-none not-italic px-[12px] legacyTablet:px-[14px] border-[2px] w-max rounded-[4px] flex items-center text-pink border-pink">
            판매중
           </i>
           <div class="flex flex-col gap-[20px]">
            <p class="text-[#00000080] text-[13px]">
             Ticket
            </p>
            <p class="text-[24px] leading-[1.4] font-[600] tracking-[-0.48px]">
             [TICKET] YUURI ARENA LIVE 2025 at SEOUL
            </p>
            <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-lidIEE wuiiW bEPtl kLABNP eSKyHB">
            </div>
            <a class="flex items-center gap-[8px]" href="https://www.bigc.im/YUURI">
             <img alt="avatar" class="object-cover rounded-full css-n0lkpj" data-nimg="1" decoding="async" height="34" loading="lazy" src="https://www.bigc.im/_next/image?url=https%3A%2F%2Fcdn.bigc.im%2Fuploads%2Favatars%2F2025%2F02%2F11%2FTpvnDqRPmajHfxVC6FY88yJPIfNBquGfkpwLwJeq.png&amp;w=96&amp;q=75" srcset="https://www.bigc.im/_next/image?url=https%3A%2F%2Fcdn.bigc.im%2Fuploads%2Favatars%2F2025%2F02%2F11%2FTpvnDqRPmajHfxVC6FY88yJPIfNBquGfkpwLwJeq.png&amp;w=48&amp;q=75 1x, https://www.bigc.im/_next/image?url=https%3A%2F%2Fcdn.bigc.im%2Fuploads%2Favatars%2F2025%2F02%2F11%2FTpvnDqRPmajHfxVC6FY88yJPIfNBquGfkpwLwJeq.png&amp;w=96&amp;q=75 2x" style="color: transparent;" width="34"/>
             <p class="text-[15px] tracking-[-0.6px] leading-none font-[500]">
              유우리 (YUURI)
             </p>
            </a>
           </div>
           <div class="sc-guDLey sc-cbDaos fDfucp" display="flex" width="100%">
            <div class="sc-guDLey sc-cbDaos gefcGj" display="flex" width="100%">
             <p class="text-[13px] text-[#00000080]">
              통화선택
             </p>
             <details class="relative">
              <summary class="z-10">
               <div class="border border-[#00000033] rounded-[4px] flex items-center px-[20px] gap-[6px] hover:bg-hover h-[56px]">
                <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full items-center flex ic-new-krw text-[8px] css-bxy6ch">
                </i>
                <p class="text-[13px]">
                 KRW
                </p>
                <i class="bcon ic-new-angle-down text-[6px] ml-[auto]">
                </i>
               </div>
              </summary>
              <div class="z-20 absolute top-[100%] inset-x-0">
               <ul class="border mt-[10px] border-[#00000033] rounded-[4px] overflow-hidden bg-white css-ne2uih">
                <li class="flex h-[60px] items-center px-[20px] legacyTablet:hover:bg-hover cursor-pointer gap-[6px]">
                 <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full flex items-center ic-new-krw text-[8px]">
                 </i>
                 <p class="text-[13px]">
                  KRW
                 </p>
                </li>
                <li class="flex h-[60px] items-center px-[20px] legacyTablet:hover:bg-hover cursor-pointer gap-[6px]">
                 <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full flex items-center ic-new-usd text-[14px]">
                 </i>
                 <p class="text-[13px]">
                  USD
                 </p>
                </li>
                <li class="flex h-[60px] items-center px-[20px] legacyTablet:hover:bg-hover cursor-pointer gap-[6px]">
                 <i class="bcon w-[22px] bg-black text-white aspect-square rounded-full flex items-center ic-new-jpy text-[14px]">
                 </i>
                 <p class="text-[13px]">
                  JPY
                 </p>
                </li>
               </ul>
              </div>
             </details>
            </div>
            <div class="sc-guDLey sc-cbDaos gefcGj" display="flex" width="100%">
             <p class="text-[13px] text-[#00000080]">
              공연선택
             </p>
             <details class="relative">
              <summary class="z-10">
               <div class="sc-guDLey sc-iVheDh kXBRPd border border-[#00000033] rounded-[4px] flex items-center px-[20px] gap-[6px] hover:bg-hover h-[46px] text-[13px]" display="flex">
                <p class="text-[#888] leading-none">
                 공연을 선택해주세요.
                </p>
                <i class="bcon ic-new-angle-down text-[6px] ml-[auto]">
                </i>
               </div>
              </summary>
              <div class="z-20 absolute top-[100%] inset-x-0">
               <ul class="border mt-[10px] border-[#00000033] rounded-[4px] bg-white css-ne2uih">
                <div class="sc-guDLey sc-iVheDh sc-hVsJot jTHFHK jWGSod" display="flex">
                 <button class="sc-csKJxZ cbLUHG" display="flex" height="100%" width="100%">
                  <div class="sc-guDLey sc-iVheDh bgWiLu" display="flex" width="100%">
                   <div class="sc-guDLey sc-cbDaos ckvOst" display="flex">
                    <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-fImfOe wuiiW bEPtl kLABNP fjRWA-d">
                     DAY 1 :
                    </div>
                    <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-fImfOe wuiiW bEPtl kLABNP fjRWA-d">
                     2025-05-03 18:00 (KST)
                    </div>
                   </div>
                  </div>
                 </button>
                </div>
                <div class="sc-guDLey sc-iVheDh sc-hVsJot jTHFHK jWGSod" display="flex">
                 <button class="sc-csKJxZ cbLUHG" display="flex" height="100%" width="100%">
                  <div class="sc-guDLey sc-iVheDh bgWiLu" display="flex" width="100%">
                   <div class="sc-guDLey sc-cbDaos ckvOst" display="flex">
                    <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-fImfOe wuiiW bEPtl kLABNP fjRWA-d">
                     DAY 2 :
                    </div>
                    <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-fImfOe wuiiW bEPtl kLABNP fjRWA-d">
                     2025-05-04 17:00 (KST)
                    </div>
                   </div>
                  </div>
                 </button>
                </div>
               </ul>
              </div>
             </details>
            </div>
           </div>
            <!--  
           <div class="sc-guDLey sc-iVheDh gzrNVl" display="flex">
            <button class="sc-csKJxZ ETwMe" display="flex" height="50px" width="50px">
             <img class="sc-dmyCSP esrLxS" height="16px" src="/icons/club/ic_heart.svg" style="fill: rgb(187, 187, 187); cursor: pointer;" width="17.6px"/>
            </button>
            <button class="sc-csKJxZ dHzrwY" display="flex" height="50px" width="273px">
             <div class="sc-guDLey sc-kiTBBF sc-hVcFVo sc-hbaYEB wuiiW bEPtl kLABNP jCfNQo">
              로그인하기
             </div>
            </button>
           </div>
            -->
          </div>
         </div>
        </section>
        <div>
         <div class="mb-[40px] w-full flex justify-center">
          <span class="font-[500] text-[16px] leading-[16px] text-black">
          </span>
         </div>
         <article class="border-t border-[rgba(0,0,0,0.15)] min-w-[1200px] mt-10 pt-[80px]">
          <div class="container layout-x-padding flex justify-between">
           <svg fill="none" height="20" width="187" xmlns="http://www.w3.org/2000/svg">
            <path d="M8.709 6.615q0 .95-.448 1.791-.45.843-1.434 1.38-.986.52-2.526.52H2.043v5.053H0V2.905h4.3q1.434 0 2.42.502 1.003.484 1.487 1.326.502.843.502 1.882M4.3 8.639q1.164 0 1.738-.52.573-.537.573-1.504 0-2.043-2.311-2.043H2.043v4.067zM14.94 15.52q-1.398 0-2.527-.627a4.65 4.65 0 0 1-1.774-1.792q-.645-1.164-.645-2.688 0-1.505.663-2.67a4.6 4.6 0 0 1 1.81-1.791q1.146-.627 2.562-.628 1.416 0 2.562.628a4.6 4.6 0 0 1 1.81 1.792q.663 1.164.663 2.67 0 1.505-.68 2.67a4.76 4.76 0 0 1-1.864 1.81q-1.166.626-2.58.626m0-1.774a3 3 0 0 0 1.469-.376q.699-.375 1.129-1.129.43-.752.43-1.828 0-1.075-.412-1.81-.413-.751-1.094-1.128a3 3 0 0 0-1.469-.377 3 3 0 0 0-1.47.377q-.662.376-1.056 1.129-.395.735-.395 1.81 0 1.595.807 2.472.825.86 2.06.86M35.344 5.486l-3.065 9.873h-2.15L28.14 8.066l-1.989 7.293h-2.15l-3.082-9.873h2.078l2.061 7.938 2.097-7.938h2.132l2.007 7.902 2.043-7.902zM45.92 10.18q0 .555-.073 1.004h-7.543q.09 1.183.878 1.9t1.935.716q1.648 0 2.33-1.38h2.203a4.48 4.48 0 0 1-1.63 2.24q-1.165.86-2.903.86-1.416 0-2.545-.627a4.7 4.7 0 0 1-1.756-1.792q-.627-1.164-.627-2.688 0-1.523.61-2.67a4.4 4.4 0 0 1 1.738-1.791q1.128-.627 2.58-.628 1.398 0 2.49.61a4.3 4.3 0 0 1 1.703 1.72q.61 1.092.61 2.527m-2.133-.645q-.017-1.128-.806-1.81-.789-.68-1.954-.68-1.057 0-1.81.68-.752.664-.895 1.81zM49.972 6.92a3.16 3.16 0 0 1 1.183-1.165q.753-.43 1.774-.43v2.114h-.52q-1.2 0-1.828.61-.609.608-.609 2.114v5.196H47.93V5.486h2.043zM63.856 10.18q0 .555-.072 1.004H56.24q.09 1.183.878 1.9t1.935.716q1.65 0 2.33-1.38h2.204a4.48 4.48 0 0 1-1.63 2.24q-1.165.86-2.904.86-1.416 0-2.544-.627a4.7 4.7 0 0 1-1.756-1.792q-.627-1.164-.627-2.688 0-1.523.609-2.67a4.4 4.4 0 0 1 1.738-1.791q1.129-.627 2.58-.628 1.398 0 2.491.61a4.3 4.3 0 0 1 1.702 1.72q.61 1.092.61 2.527m-2.133-.645q-.017-1.128-.806-1.81-.789-.68-1.953-.68-1.057 0-1.81.68-.753.664-.896 1.81zM65.185 10.378q0-1.488.61-2.634.626-1.147 1.683-1.774a4.54 4.54 0 0 1 2.384-.646 4.5 4.5 0 0 1 1.9.43q.948.413 1.504 1.111V2.1h2.06v13.26h-2.06v-1.487q-.501.717-1.397 1.182-.878.466-2.025.466a4.5 4.5 0 0 1-2.365-.645 4.8 4.8 0 0 1-1.685-1.828q-.61-1.182-.61-2.67m8.081.035q0-1.02-.43-1.774a2.9 2.9 0 0 0-1.093-1.146 2.9 2.9 0 0 0-1.47-.395q-.788 0-1.468.395-.682.376-1.112 1.129-.412.735-.412 1.756t.412 1.791q.43.77 1.112 1.183.698.394 1.469.394.788 0 1.47-.394a2.9 2.9 0 0 0 1.092-1.147q.43-.77.43-1.792M84.708 6.955q.52-.717 1.415-1.165a4.4 4.4 0 0 1 2.025-.466q1.308 0 2.365.628 1.057.627 1.667 1.792.609 1.146.609 2.634 0 1.486-.61 2.67a4.6 4.6 0 0 1-1.684 1.827 4.4 4.4 0 0 1-2.347.645q-1.147 0-2.043-.448-.877-.447-1.398-1.146v1.433h-2.042V2.099h2.042zm6.002 3.423q0-1.022-.43-1.756a2.74 2.74 0 0 0-1.11-1.13 2.9 2.9 0 0 0-1.47-.394q-.771 0-1.47.395a3 3 0 0 0-1.11 1.146q-.413.754-.413 1.774 0 1.022.413 1.792a3 3 0 0 0 1.11 1.147q.699.394 1.47.394.788 0 1.47-.394a2.95 2.95 0 0 0 1.11-1.183q.43-.77.43-1.791M103.697 5.486 97.64 20h-2.114l2.007-4.802-3.889-9.712h2.276l2.777 7.526 2.885-7.526zM135.022 9.972a4.74 4.74 0 0 0-1.792-1.428 4.2 4.2 0 0 0 1.195-1.278 4.3 4.3 0 0 0 .597-2.288 4 4 0 0 0-.443-1.929 4.04 4.04 0 0 0-1.313-1.484C132.132.744 130.472.33 128.338.33h-8.587v17.23h9.114c2.226 0 3.961-.417 5.156-1.234a4.14 4.14 0 0 0 1.858-3.628 4.45 4.45 0 0 0-.852-2.732zm-7.233-3.031h-2.882V4.328h2.882c1.831 0 2.042.742 2.042 1.295 0 .554-.211 1.318-2.042 1.318m-2.882 3.852h3.58c1.915 0 2.134.795 2.134 1.392 0 .598-.219 1.393-2.134 1.393h-3.58zM142.709.335h-5.205v17.23h5.205zM153.957 4.495c.72 0 1.428.158 2.078.465s1.221.76 1.669 1.313l.197.22 3.365-3.101-.18-.22a8.4 8.4 0 0 0-3.145-2.34 10.7 10.7 0 0 0-4.221-.809 10.2 10.2 0 0 0-4.827 1.142 8.47 8.47 0 0 0-3.36 3.189 9.46 9.46 0 0 0 0 9.241 8.53 8.53 0 0 0 3.338 3.189 9.9 9.9 0 0 0 4.774 1.133c1.261 0 2.517-.189 3.725-.558a10.9 10.9 0 0 0 3.307-1.612l.119-.087V8.294h-4.669v4.669a5.6 5.6 0 0 1-2.201.439 4.5 4.5 0 0 1-2.262-.567 3.97 3.97 0 0 1-1.519-1.572 4.8 4.8 0 0 1-.545-2.32 4.4 4.4 0 0 1 .268-1.743 4.4 4.4 0 0 1 .927-1.502c.417-.404.913-.72 1.458-.931a4.4 4.4 0 0 1 1.708-.281zM175.633 11.57a4.48 4.48 0 0 1-3.628 1.836 4.43 4.43 0 0 1-2.227-.553 3.84 3.84 0 0 1-1.498-1.555 5.4 5.4 0 0 1-.536-2.345c0-.813.185-1.612.536-2.346.338-.65.861-1.19 1.498-1.555a4.44 4.44 0 0 1 2.227-.557 4.499 4.499 0 0 1 3.623 1.84l.198.237 3.373-3.1-.171-.22A8.05 8.05 0 0 0 175.931.84a10.05 10.05 0 0 0-4.177-.839 9.86 9.86 0 0 0-4.774 1.142 8.47 8.47 0 0 0-3.325 3.189 9.415 9.415 0 0 0 0 9.241 8.47 8.47 0 0 0 3.325 3.189 9.9 9.9 0 0 0 4.774 1.133c1.437.022 2.86-.259 4.177-.83a8.05 8.05 0 0 0 3.097-2.411l.171-.22-3.373-3.105-.189.241zM183.583 17.684a2.756 2.756 0 0 0 2.762-2.75c0-1.519-1.238-2.749-2.762-2.749a2.756 2.756 0 0 0-2.763 2.75c0 1.52 1.238 2.75 2.763 2.75" fill="#000">
            </path>
           </svg>
           <div class="flex pb-[120px]">
            <div class="flex flex-col text-[15px] font-[500] leading-none mr-[180px] css-1l4u6wu">
             <a class="hover:underline" href="/policy/privacy" target="_blank">
              개인정보처리방침
             </a>
             <a class="hover:underline" href="/policy/terms" target="_blank">
              서비스 이용약관
             </a>
             <a class="hover:underline" href="/policy/operation" target="_blank">
              운영정책
             </a>
            </div>
            <div class="text-[15px] text-[#aaa] leading-none tracking-[-0.45px] flex flex-col css-1l4u6wu">
             <div class="flex items-center">
              <div class="sc-guDLey wuiiW">
               회사명 : (주)빅크
              </div>
              <hr class="border-l border-[#aaa] mx-[16px] h-[14px]"/>
              <div class="sc-guDLey wuiiW">
               대표이사 : 김미희
              </div>
             </div>
             <div class="sc-guDLey wuiiW leading-[1.5]">
              서울특별시 강남구 선릉로 667 7층 빅크
             </div>
             <div class="sc-guDLey wuiiW">
              사업자등록번호 : 572-86-02360
             </div>
             <div class="sc-guDLey wuiiW">
              통신판매업신고 : 제 2024-서울강남-02421 호
             </div>
             <a class="hover:underline" href="mailto:support@bigc.im">
              support@bigc.im
             </a>
            </div>
           </div>
          </div>
         </article>
        </div>
       </div>
      </div>
     </div>
    </div>
    <div class="css-4kd6z5">
    </div>
    <div class="css-4kd6z5">
    </div>
    <div class="fixed z-[100] overflow-x-hidden flex flex-col-reverse gap-[8px] mt-[100px] top-[40px] right-[40px] css-4kd6z5">
    </div>
   </main>
  </div>
  <script id="__NEXT_DATA__" type="application/json">
   {"props":{"seo":{"title":"유우리 (YUURI) | [TICKET] YUURI ARENA LIVE 2025 at SEOUL","description":"Dive into K-pop \u0026 culture live and events |ビック, 公演とイベント 최애 아티스트와 더 가까이 연결되는 순간. 빅크","image":"https://cdn.bigc.im/uploads/attachments/2025/02/11/bF1axHZdsSuG5K143n2LtP9o8jEjvWc4HY5vLnH4.png","keywords":"빅크, 케이팝, K팝, 케이컬쳐, K컬쳐, 라이브, 콘서트, 공연, 티켓팅, 투표, 동영상, 예능, 팬플레이, 뮤지션, 아티스트, 케이팝 앨범, 굿즈, MD, 월드투어, 투어 굿즈, ビック、K-POP、K-カルチャー、ライブ、コンサート、公演、チケッティング、投票,動画,芸能,ファンプレイ,ミュージシャン,アーティスト,K-POPアルバム,グッズ,MD，ワールドツアー, Bigc, K-pop, K-culture, K-culture, live, concert, performance, ticketing, voting, video, entertainment, fanplay, musician, artist, K-pop album, goods, MD, world tour, tourmerch","url":"https://www.bigc.im/YUURI/clubs/W8K5332Z65","service":"bigc","classification":"YUURI","structuredData":null}},"page":"/[aliasName]/clubs/[clubId]","query":{"aliasName":"YUURI","clubId":"W8K5332Z65"},"buildId":"y-nHERL4cJNfYX2w8jaZ7","isFallback":false,"appGip":true,"scriptLoader":[]}
  </script>
  <script data-nscript="afterInteractive" id="google-tag-manager">
   (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-PFVCJ6CD');
  </script>
  <script data-nscript="afterInteractive" src="https://accounts.google.com/gsi/client">
  </script>
  <script crossorigin="anonymous" data-nscript="afterInteractive" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js">
  </script>
  <script data-nscript="afterInteractive" src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js">
  </script>
  <next-route-announcer>
   <p aria-live="assertive" id="__next-route-announcer__" role="alert" style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; top: 0px; width: 1px; white-space: nowrap; overflow-wrap: normal;">
   </p>
  </next-route-announcer>
  <script data-nscript="afterInteractive" id="channel-talk">
   (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "07d3d62d-81ee-44cd-964d-9c6c38f69bb3",
  });
  </script>
  <div class="notranslate" id="ch-plugin" style="z-index: 10000000 !important;">
   <div id="ch-plugin-entry">
    <div style="display: block !important;">
    </div>
   </div>
   <div class="ch-messenger-hidden ch-desk-messenger" id="ch-plugin-script" style="bottom: 93px !important;right: 27px !important;">
    <iframe id="ch-plugin-script-iframe" style="position:relative!important;height:100%!important;width:100%!important;border:none!important;" title="Channel chat">
    </iframe>
   </div>
   <style data-styled="active" data-styled-version="5.3.9">
   </style>
  </div>
  <script charset="" id="" type="text/javascript">
   !function(b,e,f,g,a,c,d){b.fbq||(a=b.fbq=function(){a.callMethod?a.callMethod.apply(a,arguments):a.queue.push(arguments)},b._fbq||(b._fbq=a),a.push=a,a.loaded=!0,a.version="2.0",a.queue=[],c=e.createElement(f),c.async=!0,c.src=g,d=e.getElementsByTagName(f)[0],d.parentNode.insertBefore(c,d))}(window,document,"script","https://connect.facebook.net/en_US/fbevents.js");fbq("init","2375901832584041");fbq("track","PageView");
  </script>
  <noscript>
   <img height="1" src="https://www.facebook.com/tr?id=2375901832584041&amp;ev=PageView&amp;noscript=1" style="display:none" width="1"/>
  </noscript>
  <script charset="" id="" type="text/javascript">
   function getCookie(a){return(a=document.cookie.match(new RegExp("(^| )"+a+"\x3d([^;]+)")))?a[2]:null}
function fetchUserData(){var a=getCookie("_bigc_token");return a?fetch("https://melchior.bigc.im/api/v2/common/data/user",{method:"GET",headers:{"Content-Type":"application/json",Authorization:"Bearer "+a}}).then(function(b){if(!b.ok)throw Error("Network response was not ok");return b.json()}).then(function(b){if(b.success&&b.data)return b.data;throw Error("API \ud638\ucd9c\uc774 \uc2e4\ud328\ud588\uac70\ub098 \uc131\uacf5\uc801\uc778 \ub370\uc774\ud130\ub97c \ubc1b\uc9c0 \ubabb\ud588\uc2b5\ub2c8\ub2e4.");})["catch"](function(b){throw b;
}):Promise.resolve({name:null,external_uuid:null,resourceId:null,isEmail:null,isPush:null,isSms:null,lang:null})}fetchUserData().then(function(a){var b=a.name||null,c=a.external_uuid||null,d=a.resourceId||null,e=a.isEmail||null,f=a.isPush||null,g=a.isSms||null,h=a.lang||null;a=a.isKakao||null;window.dataLayer=window.dataLayer||[];window.dataLayer.push({event:"custom_page_view",bigc:{userName:b,useruuid:c,userresourceId:d,userisEmail:e,userisPush:f,userisSms:g,userlang:h,userisKakao:a}})})["catch"](function(a){});
  </script>
  <iframe height="0" style="display: none; visibility: hidden;" width="0">
  </iframe>
  <iframe allow="join-ad-interest-group" data-load-time="1740463995741" data-tagging-id="G-RV674RBXVV" height="0" src="https://td.doubleclick.net/td/ga/rul?tid=G-RV674RBXVV&amp;gacid=36874957.1740463996&amp;gtm=45je52o0v9175519150z89175504194za200zb9175504194&amp;dma=0&amp;gcd=13l3l3l3l1l1&amp;npa=0&amp;pscdl=noapi&amp;aip=1&amp;fledge=1&amp;frm=0&amp;tag_exp=101732279~101732281~102067808~102482433~102539968~102558064~102587591~102605417~102640600~102658453&amp;z=539738154" style="display: none; visibility: hidden;" width="0">
  </iframe>
  <iframe allow="join-ad-interest-group" data-load-time="1740463995818" data-tagging-id="AW-315497884" height="0" src="https://td.doubleclick.net/td/rul/315497884?random=1740463995807&amp;cv=11&amp;fst=1740463995807&amp;fmt=3&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=45be52o0v893030600z89175504194za200zb9175504194&amp;gcd=13l3l3l3l1l1&amp;dma=0&amp;tag_exp=101732282~101732284~102067808~102482433~102539968~102558064~102587591~102605417~102640600~102658453&amp;u_w=1920&amp;u_h=1080&amp;url=https%3A%2F%2Fwww.bigc.im%2FYUURI%2Fclubs%2FW8K5332Z65&amp;hn=www.googleadservices.com&amp;frm=0&amp;tiba=%EC%9C%A0%EC%9A%B0%EB%A6%AC%20(YUURI)%20%7C%20%5BTICKET%5D%20YUURI%20ARENA%20LIVE%202025%20at%20SEOUL&amp;npa=0&amp;pscdl=noapi&amp;auid=538802882.1740463995&amp;uaa=x86&amp;uab=64&amp;uafvl=Not(A%253ABrand%3B99.0.0.0%7CGoogle%2520Chrome%3B133.0.6943.127%7CChromium%3B133.0.6943.127&amp;uamb=0&amp;uam=&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;fledge=1&amp;data=event%3Dgtag.config" style="display: none; visibility: hidden;" width="0">
  </iframe>
  <iframe allow="join-ad-interest-group" data-load-time="1740463996110" data-tagging-id="AW-16796759376/_-uyCKyq7O8ZENDqqMk-" height="0" src="https://td.doubleclick.net/td/rul/16796759376?random=1740463996103&amp;cv=11&amp;fst=1740463996103&amp;fmt=3&amp;bg=ffffff&amp;guid=ON&amp;async=1&amp;gtm=45be52o0v9200907001z89175504194za201zb893030600&amp;gcd=13l3l3l3l1l1&amp;dma=0&amp;tag_exp=101732279~101732281~102067808~102482433~102539968~102558064~102587591~102605417~102640600~102658453&amp;u_w=1920&amp;u_h=1080&amp;url=https%3A%2F%2Fwww.bigc.im%2FYUURI%2Fclubs%2FW8K5332Z65&amp;label=_-uyCKyq7O8ZENDqqMk-&amp;hn=www.googleadservices.com&amp;frm=0&amp;tiba=%EC%9C%A0%EC%9A%B0%EB%A6%AC%20(YUURI)%20%7C%20%5BTICKET%5D%20YUURI%20ARENA%20LIVE%202025%20at%20SEOUL&amp;value=0&amp;currency_code=JPY&amp;bttype=purchase&amp;npa=0&amp;pscdl=noapi&amp;auid=538802882.1740463995&amp;uaa=x86&amp;uab=64&amp;uafvl=Not(A%253ABrand%3B99.0.0.0%7CGoogle%2520Chrome%3B133.0.6943.127%7CChromium%3B133.0.6943.127&amp;uamb=0&amp;uam=&amp;uap=Windows&amp;uapv=10.0.0&amp;uaw=0&amp;fledge=1&amp;capi=1&amp;ct_cookie_present=0" style="display: none; visibility: hidden;" width="0">
  </iframe>
  <script src="https://www.bigc.im/_next/static/chunks/ea88be26-62312c416727d64c.js">
  </script>
  <script src="https://www.bigc.im/_next/static/chunks/3626-00febadb3be0ba31.js">
  </script>
  <script src="https://www.bigc.im/_next/static/chunks/1778-7d5e2dd5a5d38cf3.js">
  </script>
  <script src="https://www.bigc.im/_next/static/chunks/3890-7b0fa03a13c79508.js">
  </script>
  <script src="https://www.bigc.im/_next/static/chunks/1704-fcaaa95031746cbd.js">
  </script>
  <script src="https://www.bigc.im/_next/static/chunks/pages/index-6a2283b5c1fd259b.js">
  </script>
  <script src="https://www.bigc.im/_next/static/chunks/4370-3cb3e5a9c5551961.js">
  </script>
  <script src="https://www.bigc.im/_next/static/chunks/pages/%5BaliasName%5D-be453ac687323303.js">
  </script>
 </body>
</html>
