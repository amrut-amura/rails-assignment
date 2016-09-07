class EmployeesController < ApplicationController
  def index
  end
  def new
    # render plain: params
  	@employee = Employee.new(company_id: params["company_id"])

  end
  def create
  	# render plain: params

  	@e = Employee.create(allow_employee)
  	@e.create_address(allow_address)
  	redirect_to [@e.company]
  end

  def show
  	@employee = Employee.find(params[:id])
  end

  def edit
    # puts "this are params#{params}"
    @employee = Employee.find(params["id"])
    # render plain: params
    # puts "found employee #{employee}"
  end


  def update
    # render plain: params 
    @employee = Employee.find(params[:id])
   if  ((@employee.update(allow_employee)) && (@employee.address.update(allow_address)))
    flash[:success] = 'Employee successfully updated!'
    redirect_to [@employee.company] 
  else
    render 'edit'
  end

  end



  def check_employee
    @e = Employee.last
    redirect_to [@e.company , @e]
  end
  def destroy
    Employee.destroy(params[:id])
    redirect_to [Company.find(params[:company_id])]
  end
  private
    def allow_employee
   # puts params.require(:employee).permit(:name,:email,:phone,:salary,:designation)
    params.require(:employee).store( :company_id , params[:company_id])
  	params.require(:employee).permit(:name,:email,:phone,:salary,:designation,:company_id)
  end

  def allow_address
  	params["employee"].require(:addr).permit(:info)
  end
end
