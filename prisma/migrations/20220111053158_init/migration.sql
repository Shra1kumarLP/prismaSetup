-- CreateTable
CREATE TABLE "employees" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "mob_number" VARCHAR(50) NOT NULL,
    "category" VARCHAR(50) NOT NULL,
    "payment_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "join_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "position" VARCHAR(50) NOT NULL,
    "address_line_1" VARCHAR(50) NOT NULL,
    "address_line_2" VARCHAR(50) NOT NULL,
    "pincode" VARCHAR(50) NOT NULL,
    "dob" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email_id" TEXT NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "company_id" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "mob_number" VARCHAR(50) NOT NULL,
    "email_id" VARCHAR(50) NOT NULL,
    "company_id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "companies" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "category" VARCHAR(50) NOT NULL,
    "owner_name" VARCHAR(50) NOT NULL,
    "est_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "address_line_1" VARCHAR(50) NOT NULL,
    "address_line_2" VARCHAR(50) NOT NULL,
    "pincode" VARCHAR(50) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "no_of_employees" TEXT NOT NULL,
    "email_id" TEXT NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "companies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "salary_management" (
    "id" TEXT NOT NULL,
    "employee_id" TEXT NOT NULL,
    "category" VARCHAR(50) NOT NULL,
    "salary" INTEGER NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "salary_management_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "attendances" (
    "id" TEXT NOT NULL,
    "employee_id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "status" VARCHAR(50) NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "attendances_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bank_details" (
    "id" TEXT NOT NULL,
    "employee_id" TEXT NOT NULL,
    "acc_number" INTEGER NOT NULL,
    "bank_name" VARCHAR(50) NOT NULL,
    "branch_id" VARCHAR(50) NOT NULL,
    "ifsc_code" VARCHAR(50) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "banks" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "status" VARCHAR(50) NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "banks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "salary_additions" (
    "id" TEXT NOT NULL,
    "salary_id" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "addition_reason" VARCHAR(50) NOT NULL,
    "amount" INTEGER NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "salary_additions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "salary_deductions" (
    "id" TEXT NOT NULL,
    "salary_id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deduction_reason" VARCHAR(50) NOT NULL,
    "amount" INTEGER NOT NULL,
    "created_by" TEXT NOT NULL,
    "modified_by" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "salary_deductions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "languages" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "code" VARCHAR(50) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "languages_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "employees_email_id_key" ON "employees"("email_id");

-- CreateIndex
CREATE UNIQUE INDEX "companies_email_id_key" ON "companies"("email_id");

-- CreateIndex
CREATE UNIQUE INDEX "salary_management_employee_id_key" ON "salary_management"("employee_id");

-- CreateIndex
CREATE UNIQUE INDEX "bank_details_employee_id_key" ON "bank_details"("employee_id");

-- CreateIndex
CREATE UNIQUE INDEX "languages_user_id_key" ON "languages"("user_id");

-- AddForeignKey
ALTER TABLE "employees" ADD CONSTRAINT "employees_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "salary_management" ADD CONSTRAINT "salary_management_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "attendances" ADD CONSTRAINT "attendances_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bank_details" ADD CONSTRAINT "bank_details_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "salary_additions" ADD CONSTRAINT "salary_additions_salary_id_fkey" FOREIGN KEY ("salary_id") REFERENCES "salary_management"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "salary_deductions" ADD CONSTRAINT "salary_deductions_salary_id_fkey" FOREIGN KEY ("salary_id") REFERENCES "salary_management"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "languages" ADD CONSTRAINT "languages_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
