import React from 'react';
import Link from 'next/link';
import Image from 'next/image';
import GoogleSignIn from '@/components/GoogleSignIn';

export default function register() {
  return (
    <div className='flex flex-col items-center bg-[#D0EBFF] pb-10'>
        
        <Image
          width={199}
          height={199}
          src="/images/logo.png"
          alt="Growing Together Logo"
        />

        <div className='flex flex-col w-auto bg-[#1C7ED6] rounded-md mx-4 text-white p-10'>
            <p className='text-3xl'>Welcome!</p>
            <p className='text-xl -mt-6'>
                Please register to continue.
            </p>
            <div className='flex flex-col gap-3'>
                <div className='flex flex-col gap-1'>
                    <label htmlFor="email">First Name</label>
                    <input className='p-3 rounded-lg border-none' type="text" name="fname" id="" placeholder='First Name' />
                </div>
                <div className='flex flex-col gap-1'>
                    <label htmlFor="password">Last Name</label>
                    <input className='p-3 rounded-lg border-none' type="text" name="lname" id="" placeholder='Last Name' />
                </div>
                <div className='flex flex-col gap-1'>
                    <label htmlFor="email">Email</label>
                    <input className='p-3 rounded-lg border-none' type="email" name="email" id="" placeholder='Email' />
                </div>
                <div className='flex flex-col gap-1'>
                    <label htmlFor="password">Password</label>
                    <input className='p-3 rounded-lg border-none' type="password" name="password" id="" placeholder='Password' />
                </div>
                
            </div>
            <div className="mx-auto">
                <h3>OR</h3>
            </div>  
            <GoogleSignIn></GoogleSignIn>
            <div className='flex flex-col mt-4 text-lg items-center'>
                <p className='mb-2'>
                    Already have an account?
                </p>
                <Link href="/login">
                    Login
                </Link>
            </div>
        </div>
    </div>
  )
}
