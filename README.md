# RSpec exercise

## 建立一個 Course 的虛擬教室

* 使用者可以建立、管理 Course
* 使用者可以加入 Course

## CRUD 測試

1. 可以列出所有 courses 資料 - `courses#index`
2. 可以看到單筆 course 資料 - `courses#show`
3. 可以填寫 course 表單 - `courses#new`
4. 可以送出 course 表單 - `courses#create`
5. 可以修改 course 表單 - `courses#edit`
6. 可以更新 course 表單 - `courses#update`
7. 可以刪除 course 資料 - `courses#destroy`
8. 把首頁設為 `courses#index`

## 測試工具

* rspec-rails
* rails-controller-testing
* factory_girl_rails
* shoulda-matchers
