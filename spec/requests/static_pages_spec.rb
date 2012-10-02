require 'spec_helper'

describe "StaticPages" do
subject {page}

	share_examples_for "all static pages" do
  		it {should have_selector('h1', text:heading)}
  		it {should have_selector('title', text:full_title(page_title))}
	end
	  describe "Home page" do
	     before {visit home_path}
	     let(:heading){'Sample App'}
	     let(:page_title){''}

#	    it { should have_selector('h1',    text: 'Sample App') }
#	    it { should have_selector('title', text: full_title('')) }
	    it { should_not have_selector 'title', text: 'other things not include on pages' }

	  end

	  describe "Help page" do
	     before {visit help_path}
	      let(:heading){'Help'}
	     let(:page_title){'Help'}
#	     it { should have_selector('h1',    text: 'Help') }
#	    it { should have_selector('title', text: full_title('Help')) }
	  end

	  describe "About page" do
	    before {visit about_path}
	      let(:heading){'About'}
	      let(:page_title){'About Us'}
##
#	    it { should have_selector('h1',    text: 'About') }
#	    it { should have_selector('title', text: full_title('About Us')) }
	  end

	  describe "Contact page" do
	    before {visit contact_path}
	      let(:heading){'Contact'}
	      let(:page_title){'Contact'}
#	    it { should have_selector('h1',    text: 'Contact') }
#	    it { should have_selector('title', text: full_title('Contact')) }
	  end

		# check link of pages
		it "should have right link" do
		subject {page}
			visit root_path
			click_link "Home"
			should have_selector 'title', text:full_title('Home')
			click_link "About Us"
			should have_selector 'title', text:full_title('About Us')
			click_link "Help"
			should have_selector 'title', text:full_title('Help')
			click_link "Sign Up"
			should have_selector 'title', text:full_title('Sign Up')
		end
	end
