from behave import when, then
from playwright.sync_api import sync_playwright


@when('opening login page with url "{url:String}"')
def launch_login_page(context, url):
    playwright = sync_playwright().start()
    context.browser = playwright.chromium.launch(headless=True)  # or use p.firefox.launch(headless=False) for Firefox
    context.page = context.browser.new_page()
    context.page.goto(url)


@when('I enter username and password for user "{username}"')
def enter_credentials(context, username):
    try:
        context.page.wait_for_selector('input#username', state='visible')
        ## user should come from yaml for or so
        context.page.fill('input#username', username)
        context.page.wait_for_selector('input#password', state='visible')
        ## password should come from yaml for or so
        context.page.fill('input#password', 'password')
        context.page.click('input#kc-login')
    except Exception as e:
        print(f"An error occurred: {e}")
        raise e


@then('I expect to be logged in successfully and see the landing page')
def verify_login(context):
    try:
        context.page.wait_for_selector('div.main-content')
    except Exception as e:
        print(f"An error occurred: {e}")
        raise e
