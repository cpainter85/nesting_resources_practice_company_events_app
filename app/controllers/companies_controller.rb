class CompaniesController < ApplicationController
  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to companies_path, notice: 'Company added!'
    else
      render :new
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    if @company.update(company_params)
      redirect_to companies_path, notice: 'Company updated!'
    else
      render :edit
    end
  end

  def destroy
    Company.destroy(params[:id])
    redirect_to companies_path, notice: 'Company deleted!'
  end

  private
  def company_params
    params.require(:company).permit(:name)

  end
end
