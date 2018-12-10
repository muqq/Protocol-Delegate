### Practice
* 透過串接Spotify API來練習callback
* 熟練`block`、`protocol`、`delegate`

### 心得
* 這次練習是透過串接Spotify的WEB API來練習設計API Manager，雖然`delegate`和`protocol`蠻常用，但`block`就沒有了，常常都還要去查怎麼宣告`block`，透過這次練習，應該算背起來了。除此之外，我以前都是使用Parse和Firebase，比較少真正用到`NSURLSession`，除了練習callback，剛好也可以順便熟悉`NSURLSession`。

#### 實作
* 這次實作分成三頁，第一頁使用API去抓User的資料，callback是使用`block`。第二頁則是抓自己的資料，抓完再用`NSNotficationCenter`送出Notification，但Spotify抓自己的資料需要使用
Token，所以這邊的練習是直接寫死自己的Token，下次再開這個練習則需要再更新Token。第三頁抓歌手資料，放三個按鈕分別代別不同歌手，按下按鈕查詢歌手資料並用delegate傳回。
