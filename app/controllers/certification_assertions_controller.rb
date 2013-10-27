class CertificationAssertionsController < ApplicationController
  before_filter :find_cert, except: :index
  def index
    @pending_certs = CertificationAssertion.all(conditions: {is_verified: false}).group_by(&:certification).sort_by{|a|a[0].name}
  end

  def show
    @cert = CertificationAssertion.find(params[:id])
  end

  def edit
  end

  def update
    if (params[:commit] == "Verify")
      if !@cert.is_verified?
        @cert.verification_date = Time.now
      end
      @cert.is_verified = true
    end
    if @cert.save
      redirect_to :certification_assertions
    else
      render :edit
    end
  end

  def destroy
    @cert.destroy
    redirect_to :certification_assertions
  end

  def find_cert
    @cert = CertificationAssertion.find(params[:id])
  end
end
