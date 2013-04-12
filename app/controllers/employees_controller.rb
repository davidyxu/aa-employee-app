class EmployeesController < ApplicationController
	def new
		@employee = Employee.new
		@employee.build_employee_profile
	end
	def show
		@employee = Employee.find(params[:id])
	end
	def create
		params[:employee][:employee_profile_attributes][:height] =
		params[:employee][:employee_profile_attributes][:height].to_i + params[:feet].to_i*12
		@employee = Employee.new(params[:employee])
		@employee.build_employee_profile if @employee.employee_profile.nil?
		if @employee.save
			redirect_to employee_path(@employee)
		else
			flash.now[:employee_error] = "Please include required field. (Employee Name)"
			render :new
		end
	end
	def update
		params[:employee][:employee_profile_attributes][:height] =
		params[:employee][:employee_profile_attributes][:height].to_i + params[:feet].to_i*12
		@employee = Employee.find(params[:id])
		if params[:clear_image] == "on"
			@employee.employee_profile.avatar = nil
		end
		if @employee.update_attributes(params[:employee])
			redirect_to employee_path(@employee)
		else
			flash.now[:employee_error] = "Please include required field. (Employee Name)"
			render :edit
		end
	end
	def edit
		@employee = Employee.find(params[:id])
	end
	def destroy
		@employee = Employee.find(params[:id])
		@employee.destroy
		redirect_to employees_path
	end
	def index
		@employees = Employee.all
	end
end
