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

## Feature 測試

使用 capybara 寫 Feature spec

## 結合 devise 做測試

1. 使用者必須登入才能 new/create/edit/update/destroy course
  * 使用者 create course 必須跟 user 做關聯
2. 只有原始作者才能 create/edit/update/destroy course

## 測試工具

* rspec-rails
* rails-controller-testing
* factory_girl_rails
* shoulda-matchers
* capybara

## 開發工具

* bootstrap-sass
* simple_form
* devise
